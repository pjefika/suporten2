package vraptor_suporten2.controller.routes;

import javax.inject.Inject;

import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;

public abstract class AbstractCrudController {
	
	@Inject
	protected Result result;

	@Inject
	protected Validator validation;
	
}
