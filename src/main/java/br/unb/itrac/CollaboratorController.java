package br.unb.itrac;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import br.unb.itrac.model.Collaborator;
import br.unb.itrac.service.CollaboratorService;
import br.unb.itrac.service.DocumentService;

@Controller
public class CollaboratorController {

	private CollaboratorService collaboratorService;
	private DocumentService documentService;

	@Autowired(required = true)
	@Qualifier(value = "collaboratorService")
	public void setCollaboratorService(CollaboratorService collaboratorService) {
		this.collaboratorService = collaboratorService;
	}

	@Autowired(required = true)
	@Qualifier(value = "documentService")
	public void setDocumentService(DocumentService documentService) {
		this.documentService = documentService;
	}

	@RequestMapping(value = "/collaborators", method = RequestMethod.GET)
	public String listCollaborators(Model model) {
		model.addAttribute("collaborator", new Collaborator());
		model.addAttribute("collaborators", this.collaboratorService.listCollaborators());
		return "/collaborators";
	}

	@RequestMapping(value = "/collaborators/{id}/resume", produces = "application/pdf", method = RequestMethod.GET)
	public String showDocument(@PathVariable("id") int id, HttpServletResponse response, Model model) {
		try {
			this.documentService.serveDocument(this.collaboratorService.getCollaboratorById(id).getResume().getId(),
					response);
		} catch (Exception e) {
			model.addAttribute("exception", e);
			return "document_not_found";
		}
		return null;
	}

	@RequestMapping(value = "/collaborators/add", method = RequestMethod.POST)
	public String addCollaborator(@RequestParam("id") int id, @RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName, @RequestParam("file") CommonsMultipartFile file) {
		Collaborator collaborator = new Collaborator();
		collaborator.setId(id);
		collaborator.setFirstName(firstName);
		collaborator.setLastName(lastName);
		collaborator
				.setResume(this.documentService.addDocument("Currículo " + firstName + " " + lastName.charAt(0), file));
		this.collaboratorService.addCollaborator(collaborator);

		return "redirect:/collaborators";

	}

	@RequestMapping(value = "/collaborators/edit/save", method = RequestMethod.POST)
	public String saveCollaborator(@RequestParam("id") int id, @RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName, @RequestParam("file") CommonsMultipartFile file) {
		Collaborator collaborator;
		try {
			collaborator = this.collaboratorService.getCollaboratorById(id);
			collaborator.setFirstName(firstName);
			collaborator.setLastName(lastName);
			collaborator.setResume(this.documentService.updateDocument(collaborator.getResume().getId(),
					collaborator.getResume().getName(), file));
			this.collaboratorService.updateCollaborator(collaborator);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/collaborators";
	}

	@RequestMapping("/collaborators/remove/{id}")
	public String removeCollaborator(@PathVariable("id") int id) {
		this.collaboratorService.removeCollaborator(id);
		return "redirect:/collaborators";
	}

	@RequestMapping("/collaborators/edit/{id}")
	public String editCollaborator(@PathVariable("id") int id, Model model) {
		try {
			model.addAttribute("collaborator", this.collaboratorService.getCollaboratorById(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("collaborators", this.collaboratorService.listCollaborators());
		return "/collaborator";
	}
}
