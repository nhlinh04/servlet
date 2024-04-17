package com.example.assigment2_crud.repository;

import com.example.assigment2_crud.connect.HibernateUtils;
import org.hibernate.Session;

import java.util.List;

public abstract class BaseRepository<T,ID> {
    private Session session;
    String JPQL_FIND_ALL = "SELECT o FROM " + getClassType().getSimpleName() + " o";
    String JPQL_FIND_BY_ID = "SELECT o FROM " + getClassType().getSimpleName() + " o WHERE o.id = :id";
    String JPQL_FIND_BY_STATUS = "SELECT o FROM " + getClassType().getSimpleName() + " o WHERE o.trangThai LIKE :status";


    protected abstract Class<T> getClassType();

    public List<T> findAll(){
        session = HibernateUtils.getFACTORY().openSession();
        try {
            session.beginTransaction();
            List<T> list = session.createQuery(JPQL_FIND_ALL, getClassType()).getResultList();
            session.getTransaction().commit();
            return list;
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    public List<T> findByStatus(String status){
        session = HibernateUtils.getFACTORY().openSession();
        try {
            session.beginTransaction();
            List<T> list = session.createQuery(JPQL_FIND_BY_STATUS, getClassType())
                    .setParameter("status", status).getResultList();
            session.getTransaction().commit();
            return list;
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    public T findById(ID id){
        session = HibernateUtils.getFACTORY().openSession();
        try {
            session.beginTransaction();
            T t =session.createQuery(JPQL_FIND_BY_ID, getClassType())
                    .setParameter("id", id).getSingleResult();
            session.getTransaction().commit();
            return t;
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    public boolean save(T entity){
        session = HibernateUtils.getFACTORY().openSession();
        try {
            session.beginTransaction();
            session.saveOrUpdate(entity);
            session.getTransaction().commit();
            return true;
        } catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return false;
    }

    public boolean remove(T entity){
        session = HibernateUtils.getFACTORY().openSession();
        try {
            session.beginTransaction();
            session.remove(entity);
            session.getTransaction().commit();
            return true;
        } catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return false;
    }
}
