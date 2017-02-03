package vraptor_suporten2.controller.routes;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.RequestScoped;
import javax.inject.Inject;
import javax.validation.Valid;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import br.com.caelum.vraptor.Controller;
import vraptor_suporten2.dal.AtendimentoDAO;
import vraptor_suporten2.model.annotation.Admin;
import vraptor_suporten2.model.entities.Atendimento;
import vraptor_suporten2.model.entities.Colaborador;
import vraptor_suporten2.model.viewmodel.Relatorio;

@Controller
@RequestScoped
public class RelatorioController extends AbstractCrudController {

    @Inject
    private AtendimentoDAO dao;

    public RelatorioController() {

    }

    @Admin
    public void create() {
    }

    @Admin
    public void add(@Valid Relatorio r) throws IOException {

        validation.onErrorForwardTo(this.getClass()).create();

        List<Atendimento> lelist = dao.listar(r);

        List<Colaborador> colabList;

        List<Colaborador> colabListGuru;

        colabList = new ArrayList<Colaborador>();

        colabListGuru = new ArrayList<Colaborador>();

        for (Atendimento atendimento : lelist) {

            URL lelink = new URL("http://efika/web/services/colaborador/?login=" + atendimento.getLoginOperador());
            BufferedReader in = new BufferedReader(new InputStreamReader(lelink.openStream()));

            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                if (!colabList.contains(dexmlpraobj(inputLine))) {
                    colabList.add(dexmlpraobj(inputLine));
                }
            }

            in.close();
        }

        for (Atendimento atendimento : lelist) {

            URL lelink = new URL("http://efika/web/services/colaborador/?login=" + atendimento.getLoginGuru());
            BufferedReader in = new BufferedReader(new InputStreamReader(lelink.openStream()));

            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                if (!colabListGuru.contains(dexmlpraobj(inputLine))) {
                    colabListGuru.add(dexmlpraobj(inputLine));
                }
            }

            in.close();
        }

        result.include("colaboradoresGuru", colabListGuru);
        result.include("colaboradores", colabList);
        result.include("atendimentos", lelist);
    }

    public Colaborador dexmlpraobj(String xml) {

        JAXBContext jaxbContext;
        try {
            jaxbContext = JAXBContext.newInstance(Colaborador.class);
            Unmarshaller unmarshaller = jaxbContext.createUnmarshaller();

            StringReader reader = new StringReader(xml);
            Colaborador colab = (Colaborador) unmarshaller.unmarshal(reader);
            return colab;
        } catch (JAXBException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }

    }
}
