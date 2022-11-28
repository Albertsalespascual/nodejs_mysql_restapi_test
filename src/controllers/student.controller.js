import {pool} from '../db.js';

export const getStudents = async(req, res)=> {
    try{
    const [rows] = await pool.query('SELECT * FROM student');
    res.json(rows);
    } catch (error) {
    return res.status(500).json({
        message: 'Something goes wrong'
    });
    }
};

export const getStudent = async(req, res)=> {
    try {
    const [rows] =  await pool.query('SELECT * FROM student WHERE id = ?', [req.params.id]);
    if(rows.length <= 0) return res.status(404).json({
        message: 'Student not found'
    });
    res.json(rows[0]);
    } catch (error) {
    return res.status(500).json({
        message: 'Something goes wrong'
    });
    }
};
export const createStudents = async (req, res)=> {
    try {
    const {name,first_surname,second_surname,email_personal,email_activa,phone_number,zip_code,id_user,prom,activa_points_balance} = req.body;
    const [rows] = await pool.query('INSERT INTO student(name, first_surname, second_surname, email_personal, email_activa, phone_number, zip_code, id_user, prom, activa_points_balance) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
    [name,first_surname,second_surname,email_personal,email_activa,phone_number,zip_code, id_user, prom, activa_points_balance]);
    res.send({
        id: rows.insertId,
        name,
        second_surname,
    });
    } catch (error) {
    return res.status(500).json({
        message: 'Something goes wrong'
    });
    }
};

export const deleteStudents = async(req, res)=> {
    try {
    const [result] = await pool.query('DELETE FROM student WHERE id = ?', [req.params.id]);
    if (result.affectedRows <= 0) return res.status(404).json({
        message: 'Student not found'
    });
    res.sendStatus(204)
    } catch(error) {
    return res.status(500).json({
        message: 'Something goes wrong'
    });
    }
};

export const updateStudents = async(req, res)=> {
    try {
    const {id} = req.params;
    const {name, first_surname, second_surname, email_personal, phone_number, zip_code} = req.body;    
    const [result] = await pool.query('UPDATE student SET name = IFNULL(?,name), first_surname = IFNULL(?,first_surname), second_surname = IFNULL(?,second_surname), email_personal = IFNULL(?,email_personal), phone_number = IFNULL(?,phone_number), zip_code = IFNULL(?,zip_code) WHERE id = ?', [name, first_surname, second_surname, email_personal, phone_number, zip_code, id]);
    if(result.affectedRows === 0) return res.status(404).json({
        message: 'Student not found'
    });
    const [rows] = await pool.query('SELECT * FROM student WHERE id = ?', [id]);
    res.json(rows[0]);
    } catch(error) {
    return res.status(500).json({
        message: 'Something goes wrong'
    });
    }
};

