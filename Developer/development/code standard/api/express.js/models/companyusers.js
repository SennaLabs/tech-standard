'use strict';
const { Model } = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class CompanyUsers extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      CompanyUsers.hasOne(models.User, {
        foreignKey: 'id',
        as: 'invitedBy',
      });
      CompanyUsers.hasOne(models.Company, {
        foreignKey: 'id',
        as: 'company',
      });
    }
  }
  CompanyUsers.init(
    {
      companyId: {
        type: DataTypes.INTEGER,
        references: { model: 'company', key: 'id' },
      },
      userId: {
        type: DataTypes.INTEGER,
        references: { model: 'user', key: 'id' },
      },
      status: {
        type: DataTypes.INTEGER,
      },
      invitedById: {
        type: DataTypes.INTEGER,
        references: { model: 'user', key: 'id' },
      },
      isAdmin: {
        type: DataTypes.BOOLEAN,
      },
      lastActiveAt: DataTypes.DATE,
    },
    {
      sequelize,
      timestamps: true,
      modelName: 'CompanyUsers',
    },
  );
  return CompanyUsers;
};
