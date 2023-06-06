const Op = require('sequelize').Op;
const { QueryTypes } = require('sequelize');

const bcrypt = require('bcrypt');
const { v4: uuidv4 } = require('uuid');
const { omit } = require('lodash');

const models = require('../models');
const { getPaginateData, getPagination } = require('../utils/pagination');
const fileUploadService = require('../services/upload-file.service');

const User = models.User;
const Company = models.Company;
const Role = models.Role;
const Plant = models.Plant;
const CompanyUsers = models.CompanyUsers;
const PlantUsers = models.PlantUsers;
const RoleUsers = models.RoleUsers;
const CompanySetting = models.CompanySetting;

const createUser = async (req, isAdmin = false) => {
  if (req.body.password) {
    req.body.password = await bcrypt.hash(req.body.password, await bcrypt.genSalt(10));
  }
  const refreshToken = uuidv4();
  let data = {
    ...{ ...req.body, refreshToken },
    createdAt: new Date(),
    updatedAt: new Date(),
  };
  const emailExpire = await CompanySetting.findOne({
    where: {
      key: 'emailExpire',
    },
  });

  if (!isAdmin) {
    let expiredDate = new Date();
    const emailToken = uuidv4();
    const emailTokenExpires = expiredDate.setDate(expiredDate.getDate() + emailExpire.value || 30);
    data = {
      ...omit(data, ['password']),
      ...{
        emailToken,
        emailTokenExpires,
        status: false,
        isSuperAdmin: false,
      },
    };
  } else {
    data = {
      ...data,
      ...{
        status: true,
        isSuperAdmin: true,
      },
    };
  }
  if (await User.findOne({ where: { email: data.email }, paranoid: false })) {
    throw Error('email already exists');
  }
  return await User.create(data);
};

module.exports = {
  createUser,
};
