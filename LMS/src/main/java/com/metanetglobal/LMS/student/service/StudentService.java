package com.metanetglobal.LMS.student.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.metanetglobal.LMS.student.model.StudentVO;
import com.metanetglobal.LMS.student.repository.IStudentRepository;

@Service
public class StudentService implements IStudentService {
	@Autowired
	IStudentRepository studentRepository;
	
	public StudentVO findStudentById(int studentId) {
		return studentRepository.findStudentById(studentId);
	}
	
	public void insertStudent(StudentVO student) {
		studentRepository.insertStudent(student);
	}
	
	public void deleteStudent(String email) {
		studentRepository.deteteStudent(email);
	}
	
	public void updateStudent(StudentVO student) {
		studentRepository.updateStudent(student);
	}

}
