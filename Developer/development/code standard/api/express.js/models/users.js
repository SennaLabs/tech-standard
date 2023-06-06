'use strict';
const { Model } = require('sequelize');
const PROTECTED_ATTRIBUTES = ['password', 'token', 'emailToken', 'emailTokenExpires'];

module.exports = (sequelize, DataTypes) => {
  class User extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    toJSON() {
      let attributes = Object.assign({}, this.get());
      for (let a of PROTECTED_ATTRIBUTES) {
        delete attributes[a];
      }
      return attributes;
    }
    static associate(models) {
      // define association here
      User.belongsToMany(models.Company, {
        through: 'CompanyUsers',
        foreignKey: 'userId',
        as: 'companies',
      });
      User.belongsToMany(models.Role, {
        through: 'RoleUsers',
        foreignKey: 'userId',
        as: 'roles',
      });
      User.belongsToMany(models.Plant, {
        through: 'PlantUsers',
        foreignKey: 'userId',
        as: 'plants',
      });
      User.belongsTo(models.User, {
        as: 'modifiedBy',
        foreignKey: 'modifyBy',
      });
    }
  }
  User.init(
    {
      fullName: DataTypes.STRING,
      email: {
        type: DataTypes.STRING,
        validate: { isEmail: true },
        unique: true,
      },
      password: DataTypes.STRING,
      refreshToken: DataTypes.STRING,
      emailToken: DataTypes.STRING,
      emailTokenExpires: DataTypes.DATE,
      resetPasswordToken: DataTypes.STRING,
      status: DataTypes.BOOLEAN,
      isSuperAdmin: DataTypes.BOOLEAN,
      adIdToken: DataTypes.STRING,
      adLinkedAt: DataTypes.DATE,
      avatarImgPath: DataTypes.STRING,
      modifyBy: {
        type: DataTypes.INTEGER,
        references: { model: 'Users', key: 'id' },
      },
    },
    {
      sequelize,
      modelName: 'User',
      paranoid: true,
      timestamps: true,
    },
  );
  return User;
};
