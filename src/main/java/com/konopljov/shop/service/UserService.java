package com.konopljov.shop.service;

import com.konopljov.shop.dto.UserDTO;
import org.springframework.security.core.userdetails.UserDetailsService;
//                                --Security--
public interface UserService extends UserDetailsService {
    boolean save(UserDTO userDTO);
}
