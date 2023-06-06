const jwt = require('jsonwebtoken');
const User = require('../services/user.service');
const Company = require('../services/company.service');
const config = require('../configs/app');

const requireAuth = (req, res, next) => {
  // const token = req.cookies.jwt;
  const bearerHeader = req.headers['authorization'];
  if (bearerHeader) {
    const token = bearerHeader.split(' ')[1];
    if (token) {
      jwt.verify(token, config.secret, async (err, decoded) => {
        if (err) {
          res.locals.user = null;
          return res.status(403).json({
            status: 403,
            message: `JWT decoded error: ${err}`,
          });
        } else {
          let user = await User.findUserById(decoded.id, false);
          if (!user) {
            res.locals.user = null;
            return res.status(403).json({
              status: 403,
              message: `User is not found`,
            });
          }
          if (user.deletedAt) {
            res.locals.user = null;
            return res.status(403).json({
              status: 403,
              message: `User is deleted`,
            });
          }
          if (!user.isSuperAdmin) {
            const userActiveCompany = user.companies.filter(
              (el) => el.dataValues.isActive && el.dataValues.expiredAt > new Date(),
            );
            if (userActiveCompany.length === 0) {
              res.locals.user = null;
              return res.status(403).json({
                status: 403,
                message: `User has no active company`,
              });
            }
            const queryCompanyId = req.query.companyId;
            const bodyCompanyId = req.body.companyId;
            const paramsCompanyId = req.params.companyId;
            const companyId = queryCompanyId || bodyCompanyId || paramsCompanyId;
            if (companyId) {
              const company = await Company.findCompanyByIdForAuth(companyId);
              if (company) {
                const maxConcurrentUsers = company.concurrentUserLicense;
                const isLastActive = await Company.getLastActiveUsers(companyId, maxConcurrentUsers, user.id);
                if (!isLastActive) {
                  return res.status(429).json({
                    status: 429,
                    message: `Company has reached max concurrent users`,
                  });
                }
              }
            }
          }
          await User.updateLastActiveUser(user.id);
          res.locals.user = user;
          return next();
        }
      });
    }
  } else {
    return res.status(403).json({
      status: 403,
      message: `No authorization token provided`,
    });
  }
};

const isSuperAdmin = (req, res, next) => {
  if (res.locals.user.isSuperAdmin) {
    next();
  } else {
    return res.status(403).json({
      status: 403,
      message: `No authorization super admin`,
    });
  }
};

const requireAccessToken = (req, res, next) => {
  const bearerHeader = req.headers['authorization'];
  if (bearerHeader) {
    const token = bearerHeader.split(' ')[1];
    if (token) {
      jwt.verify(token, config.secret, async (err, decoded) => {
        if (err) {
          return res.status(403).json({
            status: 403,
            message: `AccessToken verification error: ${err}`,
          });
        } else {
          if (decoded.id === 9999) return next();
          else
            return res.status(403).json({
              status: 403,
              message: `AccessToken verification error: wrong token provided`,
            });
        }
      });
    }
  } else {
    return res.status(403).json({
      status: 403,
      message: `No access token provided`,
    });
  }
};

module.exports = { requireAuth, isSuperAdmin, requireAccessToken };
