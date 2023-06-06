module.exports.getPaginateData = (data, page, limit) => {
    const { count, rows } = data;
    const currentPage = +page;
    const totalPages = Math.ceil(count / limit);

    return { count, rows, totalPages, currentPage };
};

module.exports.getPagination = (page, size) => {
    const limit = size;
    const offset = (page - 1) * limit;

    return { limit, offset };
};
