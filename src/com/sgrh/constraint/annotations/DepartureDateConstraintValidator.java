package com.sgrh.constraint.annotations;

import java.time.LocalDate;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class DepartureDateConstraintValidator implements ConstraintValidator<DepartureDateConstraint,String>{
	
	String datevalidator;

	@Override
	public boolean isValid(String arg0, ConstraintValidatorContext arg1) {
		// TODO Auto-generated method stub
		return false;
	}
}
