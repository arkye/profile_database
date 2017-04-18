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

import br.unb.itrac.model.Document;
import br.unb.itrac.service.DocumentService;

@Controller
public class DocumentController {

	private DocumentService documentService;

	@Autowired(required = true)
	@Qualifier(value = "documentService")
	public void setDocumentService(DocumentService documentService) {
		this.documentService = documentService;
	}

	@RequestMapping(value = "/documents", method = RequestMethod.GET)
	public String listDocuments(Model model) {
		model.addAttribute("document", new Document());
		model.addAttribute("documents", this.documentService.listDocuments());
		return "documents";
	}

	@RequestMapping(value = "/documents/show/{id}", produces = "application/pdf", method = RequestMethod.GET)
	public String showDocument(@PathVariable("id") int id, HttpServletResponse response) {
		try {
			this.documentService.serveDocument(id, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/documents/add", method = RequestMethod.POST)
	public String addDocument(@RequestParam("id") int id, @RequestParam("name") String name,
			@RequestParam("file") CommonsMultipartFile file) {
		if (id == 0) {
			this.documentService.addDocument(name, file);
		} else {
			this.documentService.updateDocument(id, name, file);
		}
		return "redirect:/documents";
	}

	@RequestMapping("/documents/remove/{id}")
	public String removeDocument(@PathVariable("id") int id) {
		this.documentService.removeDocument(id);
		return "redirect:/documents";
	}

	@RequestMapping("/documents/edit/{id}")
	public String editDocument(@PathVariable("id") int id, Model model) {
		model.addAttribute("document", this.documentService.getDocumentById(id));
		model.addAttribute("documents", this.documentService.listDocuments());
		return "documents";
	}
}
