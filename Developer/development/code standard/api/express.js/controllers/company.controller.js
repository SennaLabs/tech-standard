const companyService = require('../services/company.service');

const createCompany = async (req, res) => {
  try {
    const company = await companyService.createCompany(req);
    return res.status(201).json({
      status: 201,
      data: company,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const getCompanySettings = async (req, res) => {
  try {
    const company = await companyService.getCompanySettings(req);
    return res.status(200).json({
      status: 200,
      data: company,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const findAllCompanies = async (req, res) => {
  try {
    const companies = await companyService.findAllCompanies(req);
    return res.status(200).json({
      status: 200,
      data: companies,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const findCompanyById = async (req, res) => {
  try {
    const company = await companyService.findCompanyById(req, res);
    if (company.length === 0) {
      return res.status(404).json({
        status: 404,
        message: `Company not found.`,
      });
    }
    return res.status(200).json({
      status: 200,
      data: company,
    });
  } catch (e) {
    return res.status(500).json({
      status: 500,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const getCompanyByHash = async (req, res) => {
  try {
    const company = await companyService.getCompanyByHash(req, res);
    if (company?.length === 0) {
      return res.status(404).json({
        status: 404,
        message: `Company not found.`,
      });
    }
    return res.status(200).json({
      status: 200,
      data: company,
    });
  } catch (e) {
    console.log(e);
    return res.status(500).json({
      status: 500,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const updateCompany = async (req, res) => {
  try {
    const company = await companyService.updateCompany(req);
    return res.status(201).json({
      status: 201,
      data: company,
    });
  } catch (e) {
    return res.status(500).json({
      status: 500,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const deleteCompany = async (req, res) => {
  try {
    await companyService.deleteCompany(req);
    return res.status(204).json({});
  } catch (e) {
    return res.status(500).json({
      status: 500,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const addCompanyAdminUser = async (req, res) => {
  try {
    const company = await companyService.addCompanyAdminUser(req);
    return res.status(201).json({
      status: 201,
      data: company,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};
const addCompanyNormalUser = async (req, res) => {
  try {
    const company = await companyService.addCompanyNormalUser(req);
    return res.status(201).json({
      status: 201,
      data: company,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const searchAutocomplete = async (req, res) => {
  try {
    const companies = await companyService.searchAutocomplete(req);
    return res.status(200).json({
      status: 200,
      data: companies,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const toggleHide = async (req, res) => {
  try {
    await companyService.toggleHide(req);
    return res.status(200).json({
      status: 200,
      data: { status: 'success' },
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const toggleActive = async (req, res) => {
  try {
    await companyService.toggleActive(req);
    return res.status(200).json({
      status: 200,
      data: { status: 'success' },
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const updateCompanyMetadata = async (req, res) => {
  try {
    const company = await companyService.updateCompanyMetadata(req);
    return res.status(201).json({
      status: 201,
      data: company,
    });
  } catch (e) {
    return res.status(500).json({
      status: 500,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const getCompanyTags = async (req, res) => {
  try {
    const tags = await companyService.getCompanyTags(req);
    return res.status(200).json({
      status: 200,
      data: tags,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const createCompanyTag = async (req, res) => {
  try {
    const tag = await companyService.createCompanyTag(req);
    return res.status(201).json({
      status: 201,
      data: tag,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const updateCompanyTag = async (req, res) => {
  try {
    const tag = await companyService.updateCompanyTag(req);
    return res.status(201).json({
      status: 201,
      data: tag,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const getCompanyRoles = async (req, res) => {
  try {
    const roles = await companyService.getCompanyRoles(req);
    return res.status(200).json({
      status: 200,
      data: roles,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const createCompanyRole = async (req, res) => {
  try {
    const role = await companyService.createCompanyRole(req);
    return res.status(201).json({
      status: 201,
      data: role,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const updateCompanyRole = async (req, res) => {
  try {
    const role = await companyService.updateCompanyRole(req);
    return res.status(201).json({
      status: 201,
      data: role,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const deleteCompanyRole = async (req, res) => {
  try {
    const role = await companyService.deleteCompanyRole(req);
    return res.status(201).json({
      status: 201,
      data: role,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const validateCompanyUsers = async (req, res) => {
  try {
    const users = await companyService.validateCompanyUsers(req);
    return res.status(200).json({
      status: 200,
      data: users,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const adminCount = async (req, res) => {
  try {
    const count = await companyService.adminCount(req);
    return res.status(200).json({
      status: 200,
      data: count,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const userCount = async (req, res) => {
  try {
    const count = await companyService.userCount(req);
    return res.status(200).json({
      status: 200,
      data: count,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const updateUserRole = async (req, res) => {
  try {
    const user = await companyService.updateUserRole(req);
    return res.status(200).json({
      status: 200,
      data: user,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const deleteCompanyTag = async (req, res) => {
  try {
    const tag = await companyService.deleteCompanyTag(req);
    return res.status(200).json({
      status: 200,
      data: tag,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const getCompanyUserInvite = async (req, res) => {
  try {
    const user = await companyService.getCompanyUserInvite(req);
    return res.status(200).json({
      status: 200,
      data: user,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const deleteCompanyUser = async (req, res) => {
  try {
    const user = await companyService.deleteCompanyUser(req);
    return res.status(200).json({
      status: 200,
      data: user,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const createCompanyPlant = async (req, res) => {
  try {
    const plant = await companyService.createCompanyPlant(req);
    return res.status(201).json({
      status: 201,
      data: plant,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const updateCompanyPlant = async (req, res) => {
  try {
    const plant = await companyService.updateCompanyPlant(req);
    return res.status(201).json({
      status: 201,
      data: plant,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const deleteCompanyPlant = async (req, res) => {
  try {
    const plant = await companyService.deleteCompanyPlant(req);
    return res.status(201).json({
      status: 201,
      data: plant,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const getAvailableMembers = async (req, res) => {
  try {
    const members = await companyService.getAvailableMembers(req);
    return res.status(200).json({
      status: 200,
      data: members,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const getCompanyUsers = async (req, res) => {
  try {
    const users = await companyService.getCompanyUsers(req);
    return res.status(200).json({
      status: 200,
      data: users,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const searchUserAutocomplete = async (req, res) => {
  try {
    const users = await companyService.searchUserAutocomplete(req);
    return res.status(200).json({
      status: 200,
      data: users,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const plantByCompanyId = async (req, res) => {
  try {
    const plants = await companyService.plantByCompanyId(req);
    return res.status(200).json({
      status: 200,
      data: plants,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const searchPlantAutocomplete = async (req, res) => {
  try {
    const plants = await companyService.searchPlantAutocomplete(req);
    return res.status(200).json({
      status: 200,
      data: plants,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const getMyCompanies = async (req, res) => {
  try {
    const companies = await companyService.getMyCompanies(req);
    return res.status(200).json({
      status: 200,
      data: companies,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const getMyPlants = async (req, res) => {
  try {
    const plants = await companyService.getMyPlants(req);
    return res.status(200).json({
      status: 200,
      data: plants,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const getMyCompaniesAutoComplete = async (req, res) => {
  try {
    const companies = await companyService.getMyCompaniesAutoComplete(req);
    return res.status(200).json({
      status: 200,
      data: companies,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const getMyPlantsAutoComplete = async (req, res) => {
  try {
    const plants = await companyService.getMyPlantsAutoComplete(req);
    return res.status(200).json({
      status: 200,
      data: plants,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

const getMyCompanyList = async (req, res) => {
  try {
    const companies = await companyService.getMyCompanyList(req);
    return res.status(200).json({
      status: 200,
      data: companies,
    });
  } catch (e) {
    console.log(e);
    return res.status(e.status).json({
      status: e.status,
      message: `Internal Server Error. :${e.message}`,
    });
  }
};

module.exports = {
  createCompany,
  findAllCompanies,
  findCompanyById,
  updateCompany,
  deleteCompany,
  addCompanyAdminUser,
  addCompanyNormalUser,
  searchAutocomplete,
  toggleHide,
  toggleActive,
  updateCompanyMetadata,
  getCompanyTags,
  createCompanyTag,
  updateCompanyTag,
  getCompanyRoles,
  createCompanyRole,
  updateCompanyRole,
  validateCompanyUsers,
  deleteCompanyRole,
  adminCount,
  updateUserRole,
  deleteCompanyTag,
  getCompanyUserInvite,
  deleteCompanyUser,
  getCompanyByHash,
  createCompanyPlant,
  updateCompanyPlant,
  deleteCompanyPlant,
  getAvailableMembers,
  getCompanySettings,
  getCompanyUsers,
  searchUserAutocomplete,
  userCount,
  plantByCompanyId,
  searchPlantAutocomplete,
  getMyCompanies,
  getMyPlants,
  getMyCompaniesAutoComplete,
  getMyPlantsAutoComplete,
  getMyCompanyList,
};
