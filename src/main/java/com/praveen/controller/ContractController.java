package com.praveen.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.praveen.entity.Contract;
import com.praveen.service.ContractService;

/**
 * Controller class for Contract
 * 
 * @author Praveen
 *
 */
@Controller
@RequestMapping("/ContractsWebApp")
public class ContractController {

	protected static Logger logger = Logger.getLogger(ContractController.class);

	private static boolean createFlag = false;
	private static boolean updateFlag = false;
	private static boolean deleteFlag = false;

	public ContractController() {
	}

	@Autowired
	private ContractService contractService;

	/**
	 * Get all contracts.
	 * @return
	 */
	@RequestMapping(value = { "getAllContracts", "/" })
	public ModelAndView getAllContracts() {
		logger.info("Getting the all Contracts.");
		List<Contract> contractList = contractService.getAllContracts();
		ModelAndView mv = new ModelAndView("contractList", "contractList",
				contractList);
		if (createFlag) {
			mv.addObject("message", "Contract created successfully.");
			createFlag = false;
		} else if (updateFlag) {
			mv.addObject("message", "Contract details saved.");
			updateFlag = false;
		} else if (deleteFlag) {
			mv.addObject("message", "Contract deleted successfully.");
			deleteFlag = false;
		}
		return mv;
	}

	/**
	 * Create a contract.
	 * @param contract
	 * @return
	 */
	@RequestMapping("createContract")
	public ModelAndView createContract(@ModelAttribute Contract contract) {
		logger.info("Creating Contract: " + contract);
		return new ModelAndView("contractForm");
	}

	/**
	 * Edit contract details.
	 * @param id
	 * @param contract
	 * @return
	 */
	@RequestMapping("editContract")
	public ModelAndView editEmployee(@RequestParam long id,
			@ModelAttribute Contract contract) {
		logger.info("Updating the Contract: " + contract.getCode());
		contract = contractService.getContract(id);
		return new ModelAndView("contractForm", "contractObject", contract);
	}

	/**
	 * Save contract details.
	 * @param contract
	 * @return
	 */
	@RequestMapping("saveContract")
	public ModelAndView saveEmployee(@ModelAttribute Contract contract) {
		logger.info("Saving the Contract: " + contract);
		if (contract.getId() == 0) {
			contractService.createContract(contract);
			createFlag = true;
		} else {
			contractService.updateContract(contract);
			updateFlag = true;
		}
		return new ModelAndView("redirect:getAllContracts");
	}

	/**
	 * Delete a contract.
	 * @param id
	 * @return
	 */
	@RequestMapping("deleteContract")
	public ModelAndView deleteContract(@RequestParam long id) {
		logger.info("Deleting the Contract Id: " + id);
		contractService.deleteContract(id);
		deleteFlag = true;
		return new ModelAndView("redirect:getAllContracts");
	}
}
