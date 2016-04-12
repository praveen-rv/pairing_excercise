package com.praveen.service;

import java.util.List;

import com.praveen.entity.Contract;

/**
 * ContractService
 * 
 * @author Praveen
 *
 */
public interface ContractService {
	static final String CODE_PREFIX = "ABC";

	public long createContract(Contract contract);

	public Contract updateContract(Contract contract);

	public void deleteContract(long id);

	public List<Contract> getAllContracts();

	public Contract getContract(long id);
}
