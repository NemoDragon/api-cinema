package com.example.cinemaapp.user;

import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;

    public List<UserDto> getAllUsers() {
        return userRepository.findAll()
                .stream()
                .map(user -> UserDto.builder()
                        .id(user.getId())
                        .username(user.getUsername())
                        .build())
                .toList();
    }

    public Optional<UserDto> getUserById(Integer id) {
        return userRepository.findById(id).map(user -> UserDto.builder()
                .id(user.getId())
                .username(user.getUsername())
                .build());
    }



    public Integer addUser(User user) {
        User addedUser = User.builder()
                .id(user.getId())
                .username(user.getUsername())
                .email(user.getEmail())
                .password(user.getPassword())
                .telephone(user.getTelephone())
                .build();
        return userRepository.save(addedUser).getId();
    }

    public User updateUser(Integer id, User user) {
        User foundUser = userRepository.findById(id).orElseThrow(EntityNotFoundException::new);
        foundUser.setUsername(user.getUsername());
        foundUser.setPassword(user.getPassword());
        foundUser.setEmail(user.getEmail());
        foundUser.setTelephone(user.getTelephone());
        return userRepository.save(foundUser);
    }

    public User partiallyUpdateUser(Integer id, User user) {
        User foundUser = userRepository.findById(id).orElseThrow(EntityNotFoundException::new);
        if (user.getUsername() != null) foundUser.setUsername(user.getUsername());
        if (user.getPassword() != null) foundUser.setPassword(user.getPassword());
        if (user.getEmail() != null) foundUser.setEmail(user.getEmail());
        if (user.getTelephone() != null) foundUser.setTelephone(user.getTelephone());
        return userRepository.save(foundUser);
    }

    public void deleteUser(Integer id) {
        if (!userRepository.existsById(id)) {
            throw new EntityNotFoundException();
        }
        userRepository.deleteById(id);
    }

}
