package br.unb.itrac;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import br.unb.itrac.model.Competency;
import br.unb.itrac.model.Contract;
import br.unb.itrac.model.Document;
import br.unb.itrac.model.Profile;
import br.unb.itrac.service.CompetencyService;
import br.unb.itrac.service.ContractService;
import br.unb.itrac.service.DocumentService;
import br.unb.itrac.service.ProfileService;

@Controller
public class ContractController {

	private ContractService contractService;
	private ProfileService profileService;
	private CompetencyService competencyService;
	private DocumentService documentService;

	@Autowired(required = true)
	@Qualifier(value = "contractService")
	public void setContractService(ContractService contractService) {
		this.contractService = contractService;
	}
	
	@Autowired(required = true)
	@Qualifier(value = "profileService")
	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}

	@Autowired(required = true)
	@Qualifier(value = "competencyService")
	public void setCompetencyService(CompetencyService competencyService) {
		this.competencyService = competencyService;
	}

	@Autowired(required = true)
	@Qualifier(value = "documentService")
	public void setDocumentService(DocumentService documentService) {
		this.documentService = documentService;
	}

	@RequestMapping(value = "/contracts", method = RequestMethod.GET)
	public String listContracts(Model model) {
		model.addAttribute("contract", new Contract());
		model.addAttribute("contracts", this.contractService.listContracts());
		return "contracts";
	}

	@RequestMapping(value = "/contracts/add", method = RequestMethod.POST)
	public String addContract(@ModelAttribute("contract") Contract contract) {
		this.contractService.addContract(contract);
		return "redirect:/contracts/edit/" + contract.getId();
	}

	@RequestMapping("/contracts/remove/{id}")
	public String removeContract(@PathVariable("id") int id) {
		List<Profile> profiles = this.profileService.listProfiles();
		for(Profile profile : profiles) {
			if(profile.getContract().getId() == id) {
				profile.setContract(null);
				this.profileService.removeProfile(profile.getId());
			}
		}
		
		Contract contract = this.contractService.getContractById(id);
		for(Competency competency : contract.getCompetencies()) {
			competency.setContract(null);
			this.competencyService.updateCompetency(competency);
		}
		this.contractService.removeContract(id);
		return "redirect:/contracts";
	}

	@RequestMapping("/contracts/edit/{id}")
	public String showContract(@PathVariable("id") int id, Model model) {
		Contract contract = this.contractService.getContractById(id);
		model.addAttribute("contract", contract);
		model.addAttribute("contracts", this.contractService.listContracts());
		model.addAttribute("competencies", this.competencyService.listCompetenciesWithoutContract());
		return "contract";
	}
	
	@RequestMapping(value = "/contracts/edit", method = RequestMethod.POST)
	public String editContract(@ModelAttribute("contract") Contract contract) {
		Contract databaseContract = this.contractService.getContractById(contract.getId());
		contract.setCompetencies(databaseContract.getCompetencies());
		contract.setDocuments(databaseContract.getDocuments());
		this.contractService.updateContract(contract);
		return "redirect:/contracts";
	}

	@RequestMapping("/contracts/edit/{id}/add/competency/{competency_id}")
	public String addCompetency(@PathVariable("id") int id, @PathVariable("competency_id") int competencyId) {
		Contract contract = this.contractService.getContractById(id);
		Competency competency = this.competencyService.getCompetencyById(competencyId);
		competency.setContract(contract);
		this.competencyService.updateCompetency(competency);
		contract.getCompetencies().add(competency);
		this.contractService.updateContract(contract);
		return "redirect:/contracts/edit/" + id;
	}

	@RequestMapping("/contracts/edit/{id}/remove/competency/{competency_index}")
	public String removeCompetency(@PathVariable("id") int id, @PathVariable("competency_index") int competencyIndex) {
		Contract contract = this.contractService.getContractById(id);
		Competency competency = contract.getCompetencies().get(competencyIndex);
		contract.getCompetencies().remove(competencyIndex);
		this.contractService.updateContract(contract);
		competency.setContract(null);
		this.competencyService.updateCompetency(competency);
		return "redirect:/contracts/edit/" + id;
	}

	@RequestMapping("/contracts/edit/{id}/add/document")
	public String addDocument(@PathVariable("id") int id, @RequestParam("name") String name,
			@RequestParam("file") CommonsMultipartFile file) {
		Contract contract = this.contractService.getContractById(id);
		contract.getDocuments().add(this.documentService.addDocument(name, file));
		this.contractService.updateContract(contract);
		return "redirect:/contracts/edit/" + id;
	}

	@RequestMapping("/contracts/edit/{id}/remove/document/{document_index}")
	public String removeDocument(@PathVariable("id") int id, @PathVariable("document_index") int documentIndex) {
		Contract contract = this.contractService.getContractById(id);
		Document document = contract.getDocuments().get(documentIndex);
		contract.getDocuments().remove(documentIndex);
		this.contractService.updateContract(contract);
		this.documentService.removeDocument(document.getId());
		return "redirect:/contracts/edit/" + id;
	}
}
