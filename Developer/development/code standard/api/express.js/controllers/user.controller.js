const userService = require('../services/user.service');
const fileUploadService = require('../services/upload-file.service');
const sendEmail = require('../utils/email/email');

const createUser = async (req, res) => {
  try {
    const user = await userService.createUser(req);
    await sendEmail.sendInviteEmail(user.email, user.emailToken, user.emailTokenExpires, user.fullName);

    return res.status(201).json({
      status: 201,
      data: user,
    });
  } catch (e) {
    return res.status(500).json({
      status: 500,
      message: `Internal Server Error. ${e}`,
    });
  }
};

const createAdmin = async (req, res) => {
  try {
    const user = await userService.createUser(req, true);
    return res.status(201).json({
      status: 201,
      data: user,
    });
  } catch (e) {
    return res.status(500).json({
      status: 500,
      message: `Internal Server Error. ${e}`,
    });
  }
};

const register = async (req, res) => {
  try {
    const user = await userService.updateUserByEmailToken(req);
    return res.status(201).json({
      status: 201,
      data: user,
    });
  } catch (e) {
    return res.status(500).json({
      status: 500,
      message: `Internal Server Error. ${e}`,
    });
  }
};

const findAllUsers = async (req, res) => {
  try {
    const users = await userService.findAllUsers(req);
    return res.status(200).json({
      status: 200,
      data: users,
    });
  } catch (e) {
    console.log(e);
    return res.status(500).json({
      status: 500,
      message: `Internal Server Error.`,
    });
  }
};

const userManagement = async (req, res) => {
  try {
    const users = await userService.userManagement(req);
    return res.status(200).json({
      status: 200,
      data: users,
    });
  } catch (e) {
    console.log(e);
    return res.status(500).json({
      status: 500,
      message: `Internal Server Error.`,
    });
  }
};

const restoreUser = async (req, res) => {
  try {
    const user = await userService.restoreUser(req);
    return res.status(200).json({
      status: 200,
      data: user,
    });
  } catch (e) {
    console.log(e);
    return res.status(500).json({
      status: 500,
      message: `Internal Server Error.`,
    });
  }
};

const findUserById = async (req, res) => {
  try {
    const userId = req.params.id;
    const companyId = req.query.companyId;
    const user = await userService.findUserById(userId);
    if (!user) {
      return res.status(404).json({
        status: 404,
        message: `User not found.`,
      });
    }
    return res.status(200).json({
      status: 200,
      data: user,
    });
  } catch (e) {
    console.log(e);
    return res.status(500).json({
      status: 500,
      message: `Internal Server Error. ${e}`,
    });
  }
};

const findUserByEmailToken = async (req, res) => {
  try {
    const user = await userService.findUserByEmailToken(req.query.emailToken);
    if (!user) {
      return res.status(404).json({
        status: 404,
        message: `User not found.`,
      });
    }
    if (user.status) {
      return res.status(404).json({
        status: 400,
        message: `User already registered.`,
      });
    }
    if (new Date(user.emailTokenExpires) < Date.now()) {
      return res.status(403).json({
        status: 403,
        message: `Email token expired.`,
      });
    }
    return res.status(200).json({
      status: 200,
      data: user,
    });
  } catch (e) {
    return res.status(500).json({
      status: 500,
      message: `Internal Server Error. ${e}`,
    });
  }
};

const updateUser = async (req, res) => {
  try {
    const user = await userService.updateUser(req);
    return res.status(201).json({
      status: 201,
      data: user,
    });
  } catch (e) {
    console.log(e);
    return res.status(500).json({
      status: 500,
      message: `Internal Server Error. ${e}`,
    });
  }
};

const deleteUser = async (req, res) => {
  try {
    await userService.deleteUser(req.params.id);
    return res.status(204).json({ data: 'Deleted successfully' });
  } catch (e) {
    return res.status(500).json({
      status: 500,
      message: `Internal Server Error. ${e}`,
    });
  }
};

const getMyProfile = async (req, res) => {
  try {
    const user = req.res.locals.user;
    return res.status(200).json({
      status: 200,
      data: user,
    });
  } catch (e) {
    console.log(e);
    return res.status(500).json({
      status: 500,
      message: `Internal Server Error.`,
    });
  }
};

const forgotPassword = async (req, res) => {
  try {
    const user = await userService.forgotPassword(req);
    await sendEmail.sendResetPasswordEmail(user.email, user.resetPasswordToken, user.fullName);

    return res.status(201).json({
      status: 201,
      data: { msg: 'success' },
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. ${e.message}`,
    });
  }
};

const validatePassword = async (req, res) => {
  try {
    const user = await userService.validatePassword(req);
    return res.status(200).json({
      status: 200,
      data: user,
    });
  } catch (e) {
    return res.status(400).json({
      status: 400,
      message: `${e}`,
    });
  }
};

const resetPassword = async (req, res) => {
  try {
    const user = await userService.updateUserPasswordByToken(req);
    return res.status(201).json({
      status: 201,
      data: user,
    });
  } catch (e) {
    return res.status(500).json({
      status: 500,
      message: `Internal Server Error. ${e}`,
    });
  }
};

const resendRegisterEmail = async (req, res) => {
  try {
    const user = await userService.resendEmail(req);
    await sendEmail.sendInviteEmail(user.email, user.emailToken, user.emailTokenExpires, user.fullName);
    return res.status(201).json({
      status: 201,
      data: user,
    });
  } catch (e) {
    return res.status(500).json({
      status: 500,
      message: `Internal Server Error. ${e}`,
    });
  }
};

const uploadAvatar = async (req, res) => {
  try {
    const imgPath = await fileUploadService.fileUpload(req.files, 'avatar');
    return res.status(201).json({
      status: 201,
      data: imgPath,
    });
  } catch (e) {
    return res.status(500).json({
      status: 500,
      message: `Internal Server Error. ${e}`,
    });
  }
};

const searchAutocomplete = async (req, res) => {
  try {
    const users = await userService.searchAutocomplete(req);
    return res.status(200).json({
      status: 200,
      data: users,
    });
  } catch (e) {
    return res.status(500).json({
      status: 500,
      message: `Internal Server Error. ${e}`,
    });
  }
};

const getUserCount = async (req, res) => {
  try {
    const count = await userService.getUserCount(req);
    return res.status(200).json({
      status: 200,
      data: count,
    });
  } catch (e) {
    return res.status(500).json({
      status: 500,
      message: `Internal Server Error. ${e}`,
    });
  }
};

const getMyRole = async (req, res) => {
  try {
    const role = await userService.getMyRole(req);
    return res.status(200).json({
      status: 200,
      data: role,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. ${e.message}`,
    });
  }
};

const getProfile = async (req, res) => {
  try {
    const user = await userService.getProfile(req);
    return res.status(200).json({
      status: 200,
      data: user,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. ${e.message}`,
    });
  }
};

const shouldSeeReport = async (req, res) => {
  try {
    const user = await userService.shouldSeeReport(req);
    return res.status(200).json({
      status: 200,
      data: user,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. ${e.message}`,
    });
  }
};

module.exports = {
  createUser,
  findAllUsers,
  findUserById,
  updateUser,
  deleteUser,
  getMyProfile,
  createAdmin,
  register,
  findUserByEmailToken,
  resetPassword,
  forgotPassword,
  resendRegisterEmail,
  uploadAvatar,
  searchAutocomplete,
  userManagement,
  restoreUser,
  getUserCount,
  validatePassword,
  getMyRole,
  getProfile,
  shouldSeeReport,
};
