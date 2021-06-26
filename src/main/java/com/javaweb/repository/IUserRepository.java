package com.javaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.javaweb.entity.UserEntity;

public interface IUserRepository extends JpaRepository<UserEntity, Long> {
	UserEntity findOneByUserNameAndStatus(String name, int status);
}
