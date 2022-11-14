package ca.sait.dataaccess;

import ca.sait.models.Role;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

public class RoleDB {

    public List<Role> getAll() throws Exception {
        
        EntityManagerFactory emFactory = DBUtil.getEmFactory();
        
        EntityManager em = emFactory.createEntityManager();
        
        return em.createNameQuery("Role.findAll", Role.class).getResultList();
    }
}
