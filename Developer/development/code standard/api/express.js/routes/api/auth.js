var express = require('express');
const { body, validationResult } = require('express-validator');

var router = express.Router();
const authController = require('../../controllers/auth.controller');
const userController = require('../../controllers/user.controller');
const { requireAuth } = require('../../middleware/auth.middleware');
const { validator } = require('../../middleware/validator.middleware');

router.post(
    '/login',
    body('email').isEmail(),
    body('password').isLength({ min: 2 }),
    validator,
    authController.login
);
router.post(
    '/loginWithAd',
    body('username').isEmail(),
    body('idToken').isLength({ min: 2 }),
    validator,
    authController.loginWithAd
);
router.post('/refresh', body('refreshToken').exists(), authController.refresh);
router.get('/me', requireAuth, userController.getMyProfile);
router.get('/myRole', requireAuth, userController.getMyRole);
module.exports = router;
