const User = require('../services/user.service');
const config = require('../configs/app');
const jwt = require('jsonwebtoken');
const { v4: uuidv4 } = require('uuid');

// create json web token
const maxAge = 3 * 24 * 60 * 60;
const createToken = (id, expiresIn = null) => {
  return jwt.sign({ id }, config.secret, {
    expiresIn: expiresIn || maxAge,
  });
};

module.exports.login = async (req, res) => {
  const { email, password } = req.body;

  try {
    const user = await User.loginUser(email, password);
    if (user.adIdToken) {
      return res.status(400).json({ err: 'user already logged in with AD' });
    }
    const token = createToken(user.id);
    const refreshToken = uuidv4();
    await User.updateUserRefreshToken(refreshToken, user.id);
    await User.updateLastActiveUser(user.id);
    return res.status(200).json({
      status: 200,
      data: { token, refreshToken },
    });
  } catch (err) {
    console.log(err);
    res.status(400).json({ err: err.message });
  }
};

module.exports.refresh = async (req, res) => {
  const { refreshToken } = req.body;
  try {
    const user = await User.findUserByRefreshToken(refreshToken);
    const token = createToken(user.id);
    const NewRefreshToken = uuidv4();
    await User.updateUserRefreshToken(NewRefreshToken, user.id);
    await User.updateLastActiveUser(user.id);
    return res.status(200).json({
      status: 200,
      data: { user, token, NewRefreshToken },
    });
  } catch (err) {
    console.log(err);
    res.status(400).json({ err: err.message });
  }
};

module.exports.loginWithAd = async (req, res) => {
  const { username, idToken } = req.body;

  try {
    const user = await User.findUserByEmail(username);
    if (!user) {
      return res.status(404).json({ err: 'user not found' });
    }
    const token = createToken(user.id);
    const refreshToken = uuidv4();
    await User.updateUserRefreshToken(refreshToken, user.id);
    await User.updateUserAdIdToken(idToken, user.id);
    await User.updateLastActiveUser(user.id);
    return res.status(200).json({
      status: 200,
      data: { token, refreshToken },
    });
  } catch (err) {
    console.log(err);
    res.status(400).json({ err: err.message });
  }
};

module.exports.getAccessToken = async (req, res) => {
  const expiresIn = req.query.expiresIn ?? 24 * 60 * 60 * 365;
  const username = req.query.username;
  const password = req.query.password;
  if (username != config.outBoundApi.username || password != config.outBoundApi.password) {
    return res.status(400).json({ status: 400, data: { message: 'invalid username or password' } });
  }
  try {
    const token = createToken((id = 9999), +expiresIn);
    return res.status(200).json({
      status: 200,
      data: { token },
    });
  } catch (err) {
    console.log(err);
    res.status(400).json({ status: 400, data: { message: err.message } });
  }
};
