const models = require('../models');
const Role = models.Role;
const RoleUsers = models.RoleUsers;
const User = models.User;

const permitCompanyAdmin = (...allowedRoles) => {
    return async (req, res, next) => {
        const user = await User.findOne({
            where: { id: req.res.locals.user.id },
            include: [
                {
                    model: Role,
                    as: 'roles',
                    where: {
                        companyId: req.params.companyId,
                        isAdmin: true,
                    },
                },
            ],
            limit: 1,
        });
        if (!user)
            return res.status(403).json({
                status: 403,
                message: `Forbidden resource`,
            });
        if (user.isSuperAdmin) {
            return next();
        }
        const actions = user.roles[0].action
            .map((actions) =>
                actions.group.map((group) =>
                    group.action
                        .filter((action) => action.isActive === true)
                        .map((action) => action.actionKey)
                )
            )
            .flat(3);

        const rolesArray = [...allowedRoles];
        if (
            actions
                .map((role) => rolesArray.includes(role))
                .find((val) => val === true)
        )
            return next();

        return res.status(403).json({
            status: 403,
            message: `Forbidden resource`,
        });
    };
};

module.exports = { permitCompanyAdmin };
