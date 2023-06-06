'use strict';
const { Model } = require('sequelize');
const { secret } = require('../configs/app');
var CryptoJS = require('crypto-js');

const initialRoles = require('../db/init/initial-roles');

module.exports = (sequelize, DataTypes) => {
  class Company extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      Company.belongsToMany(models.User, {
        through: 'CompanyUsers',
        as: 'users',
        foreignKey: 'companyId',
      });
      Company.belongsTo(models.User, {
        as: 'modifiedBy',
        foreignKey: 'modifyBy',
      });
      Company.hasMany(models.Role, {
        as: 'roles',
        foreignKey: 'companyId',
      });
      Company.hasMany(models.Plant, {
        as: 'plants',
        foreignKey: 'companyId',
      });
    }
  }
  Company.init(
    {
      name: DataTypes.STRING,
      code: DataTypes.STRING,
      imgPath: DataTypes.STRING,
      startAt: DataTypes.DATE,
      expiredAt: DataTypes.DATE,
      clientId: DataTypes.STRING,
      tenantId: DataTypes.STRING,
      modifyBy: {
        type: DataTypes.INTEGER,
        references: { model: 'user', key: 'id' },
      },
      apiToken: DataTypes.STRING,
      concurrentUserLicense: DataTypes.INTEGER,
      maxUserLicense: DataTypes.INTEGER,
      workingCopyZipFormat: DataTypes.STRING,
      multipleUploadZipFormat: DataTypes.STRING,
      singleMaxUploadSize: DataTypes.INTEGER,
      singleMaxUploadPerTimeSize: DataTypes.INTEGER,
      singleMaxUploadFilePerTime: DataTypes.INTEGER,
      multipleMaxUploadFilePerTime: DataTypes.INTEGER,
      workingCopyQuota: DataTypes.INTEGER,
      s3Path: DataTypes.STRING,
      isHide: DataTypes.BOOLEAN,
      deletedAt: DataTypes.DATE,
      isActive: DataTypes.BOOLEAN,
      isExpired: {
        type: DataTypes.VIRTUAL,
        get() {
          const now = new Date();
          return now > this.expiredAt;
        },
      },
      metaData: DataTypes.JSONB,
      hash: {
        type: DataTypes.STRING,
        unique: true,
      },
    },
    {
      sequelize,
      timestamps: true,
      modelName: 'Company',
      paranoid: true,
      hooks: {
        afterCreate: async (company, options) => {
          const models = require('../models');
          const hash = CryptoJS.RC4Drop.encrypt(`${company.id};${company.name};company`, secret).toString();
          await Company.update(
            { hash },
            {
              where: {
                id: company.id,
              },
              transaction: options.transaction,
            },
          );
          const Role = models.Role;
          await Role.bulkCreate(
            [
              {
                name: 'Company admin',
                action: initialRoles.companyAdmin,
                isAdmin: true,
                companyId: company.id,
              },
              {
                name: 'Document control',
                action: initialRoles.documentControl,
                isAdmin: false,
                companyId: company.id,
              },
              {
                name: 'Document reviewer',
                action: initialRoles.documentReviewer,
                isAdmin: false,
                companyId: company.id,
              },
              {
                name: 'Document approver',
                action: initialRoles.documentApprover,
                isAdmin: false,
                companyId: company.id,
              },
            ],
            { transaction: options.transaction },
          );
        },
        afterUpdate: async (company, options) => {
          const hash = CryptoJS.RC4Drop.encrypt(`${company.id};${company.name};company`, secret).toString();
          await Company.update(
            { hash },
            {
              where: {
                id: company.id,
              },
              transaction: options.transaction,
            },
          );
        },
      },
    },
  );
  return Company;
};
