package com.praveen.dao;

import java.util.List;

import com.praveen.entity.Contract;

/**
 * ContractDAO
 * 
 * @author Praveen
 *
 */
public interface ContractDAO {
	public long createContract(Contract contract);

	public Contract updateContract(Contract contract);

	public void deleteContract(long id);

	public List<Contract> getAllContracts();

	public Contract getContract(long id);
}
