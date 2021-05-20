package com.samaspace.dao;

import com.samaspace.model.Admin;

public interface IAdmin {

	public Admin authentification(String email,String pwd);
	public int updateAdmin();
	public int nbrAdmin();
}
