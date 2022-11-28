import {Router} from 'express';
import { getStudents } from '../controllers/student.controller.js';
import { createStudents } from '../controllers/student.controller.js';
import { updateStudents } from '../controllers/student.controller.js';
import { deleteStudents } from '../controllers/student.controller.js';
import { getStudent } from '../controllers/student.controller.js';

const router = Router();

router.get('/students', getStudents);

router.get('/students/:id', getStudent);

router.post('/students', createStudents);

router.patch('/students/:id', updateStudents);

router.delete('/students/:id', deleteStudents);

export default router;