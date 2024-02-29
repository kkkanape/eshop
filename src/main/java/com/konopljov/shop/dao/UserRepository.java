package com.konopljov.shop.dao;

import com.konopljov.shop.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
public interface UserRepository extends JpaRepository<User, Long> {
    User findFirstByName(String name);
}
