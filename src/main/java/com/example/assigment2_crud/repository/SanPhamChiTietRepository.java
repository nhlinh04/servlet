package com.example.assigment2_crud.repository;

import com.example.assigment2_crud.connect.HibernateUtils;
import com.example.assigment2_crud.model.SanPhamChiTiet;
import jakarta.persistence.Query;
import org.hibernate.Session;

import java.util.List;

public class SanPhamChiTietRepository extends BaseRepository<SanPhamChiTiet, Integer> {

    private Session session;
    @Override
    protected Class<SanPhamChiTiet> getClassType() {
        return SanPhamChiTiet.class;
    }

    public List<SanPhamChiTiet> findByIdSanPham(int idSanPham){
        session = HibernateUtils.getFACTORY().openSession();
        try {
            session.beginTransaction();
            List<SanPhamChiTiet> list = session.createQuery("FROM SanPhamChiTiet o WHERE o.sanPham.id =:idSanPham")
                    .setParameter("idSanPham", idSanPham).getResultList();
            session.getTransaction().commit();
            return list;
        } catch (Exception e ){
            e.printStackTrace();
        }finally {
            session.close();
        }
        return null;
    }

    public SanPhamChiTiet findByCart(int idSanPham, int idMau, int idSize) {
        try (Session session = HibernateUtils.getFACTORY().openSession()) {
            session.beginTransaction();
            Query query = session.createQuery(
                    "SELECT o FROM SanPhamChiTiet o " +
                            "WHERE o.sanPham.id = :idSanPham AND o.size.id = :idSize AND o.mauSac.id = :idMau");
            query.setParameter("idSanPham", idSanPham);
            query.setParameter("idSize", idSize);
            query.setParameter("idMau", idMau);
            SanPhamChiTiet result = (SanPhamChiTiet) query.getSingleResult();
            session.getTransaction().commit();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }



}
