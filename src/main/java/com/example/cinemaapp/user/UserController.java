package com.example.cinemaapp.user;


import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/users")
@RequiredArgsConstructor
@CrossOrigin
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping()
    public ResponseEntity<UserResponse> getUsers() {
        List<UserDto> users = userService.getAllUsers();
        return ResponseEntity.ok(new UserResponse(users));
    }

    @GetMapping("/{id}")
    public ResponseEntity<UserDto> getUserById(@PathVariable Integer id) {
        Optional<UserDto> user = userService.getUserById(id);
        return user.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> addUser(@RequestBody UserRequest userRequest) {
        Integer id = userService.addUser(userRequest.getUser());
        URI location = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
                .buildAndExpand(id)
                .toUri();
        return ResponseEntity.created(location).build();
    }

    @PutMapping("/{id}")
    public ResponseEntity<UserDto> updateUser(@PathVariable Integer id, @RequestBody UserRequest userRequest) {
        try {
            User updatedUser = userService.updateUser(id, userRequest.getUser());
            return ResponseEntity.ok(UserDto.builder()
                            .id(updatedUser.getId())
                            .username(updatedUser.getUsername())
                    .build());

        } catch(EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @PatchMapping ("/{id}")
    public ResponseEntity<UserDto> partiallyUpdateUser(@PathVariable Integer id, @RequestBody UserRequest userRequest) {
        try {
            User updatedUser = userService.partiallyUpdateUser(id, userRequest.getUser());
            return ResponseEntity.ok(UserDto.builder()
                    .id(updatedUser.getId())
                    .username(updatedUser.getUsername())
                    .build());

        } catch(EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteUser(@PathVariable Integer id) {
        try {
            userService.deleteUser(id);
            return ResponseEntity.noContent().build();
        } catch (EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }
}
