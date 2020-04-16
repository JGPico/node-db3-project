const db = require('../data/db-config.js');

module.exports = {
    find,
    findById,
    findSteps,
    add,
    addStep,
    update,
    remove
}

function find() {
    return db('schemes');
}

function findById(id) {
    return db('schemes').where({id}).first();
}

function findSteps(id) {
    return db('steps as st')
    .join('schemes as sc', 'st.scheme_id', '=', 'sc.id')
    .select('sc.scheme_name', 'st.step_number', 'st.instructions')
    .where({scheme_id: id})
    .orderBy('st.step_number');
}

function add(newScheme) {
    return db('schemes')
    .insert(newScheme, "id")
    .then(([id]) => {
        return findById(id);
    });
}

function addStep() {
    return db('schemes');
}

function update(changes, id) {
    return db('schemes')
    .where({id})
    .update(changes)
    .then(() => {
        return findById(id);
    });
}

function remove(id) {
    return findById(id).then((scheme) => {
        return db('scheme')
        .where({id})
        .del()
        .then(() => scheme);
    });
}