package com.praveen.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.praveen.dao.ContractDAO;
import com.praveen.entity.Contract;

/**
 * ContractServiceImpl
 * 
 * @author Praveen
 *
 */
@Service
@Transactional
public class ContractServiceImpl implements ContractService {
	public ContractServiceImpl() {
	}

	@Autowired
	private ContractDAO ContractDAO;

	@Override
	public long createContract(Contract contract) {
		contract.setCode(CODE_PREFIX);
		long id = ContractDAO.createContract(contract);
		// update contract code
		contract.setCode(contract.getCode() + "_" + id);
		ContractDAO.updateContract(contract);
		return id;
	}

	@Override
	public Contract updateContract(Contract contract) {
		return ContractDAO.updateContract(contract);
	}

	@Override
	public void deleteContract(long id) {
		ContractDAO.deleteContract(id);
	}

	@Override
	public List<Contract> getAllContracts() {
		return ContractDAO.getAllContracts();
	}

	@Override
	public Contract getContract(long id) {
		return ContractDAO.getContract(id);
	}

}
