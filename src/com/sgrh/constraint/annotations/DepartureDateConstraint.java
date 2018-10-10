package com.sgrh.constraint.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;

@Constraint(validatedBy=DepartureDateConstraintValidator.class)
@Retention(value=RetentionPolicy.RUNTIME)
@Target(value = {ElementType.FIELD,ElementType.METHOD})
public @interface DepartureDateConstraint {
	public String value() default "";
	public String message() default "is required";
}
