package com.praveen.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.praveen.entity.Contract;
import com.praveen.util.HibernateUtil;

/**
 * ContractDAOImpl
 * 
 * @author Praveen
 *
 */
@Repository
public class ContractDAOImpl implements ContractDAO {
	public ContractDAOImpl() {
	}

	@Autowired
	private HibernateUtil hibernateUtil;

	@Override
	public long createContract(Contract contract) {
		return (Long) hibernateUtil.create(contract);
	}

	@Override
	public Contract updateContract(Contract contract) {
		return hibernateUtil.update(contract);
	}

	@Override
	public void deleteContract(long id) {
		Contract Contract = new Contract();
		Contract.setId(id);
		hibernateUtil.delete(Contract);
	}

	@Override
	public List<Contract> getAllContracts() {
		return hibernateUtil.fetchAll(Contract.class);
	}

	@Override
	public Contract getContract(long id) {
		return hibernateUtil.fetchById(id, Contract.class);
	}

}
