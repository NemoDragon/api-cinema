package com.example.cinemaapp.projection;

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
@RequestMapping("/projections")
@RequiredArgsConstructor
public class ProjectionController {
    @Autowired
    private ProjectionService projectionService;

    @GetMapping()
    public ResponseEntity<ProjectionResponse> getProjections() {
        List<Projection> projections = projectionService.getAllProjections();
        return ResponseEntity.ok(new ProjectionResponse(projections));
    }

    @GetMapping("/{id}")
    public ResponseEntity<Projection> getProjectionById(@PathVariable Integer id) {
        Optional<Projection> projection = projectionService.getProjectionById(id);
        return projection.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> addProjection(@RequestBody ProjectionRequest projectionRequest) {
        Integer id = projectionService.addProjection(projectionRequest.getProjection());
        URI location = ServletUriComponentsBuilder.fromCurrentRequest()
                .path("/{id}")
                .buildAndExpand(id)
                .toUri();
        return ResponseEntity.created(location).build();
    }

    @PutMapping("/{id}")
    public ResponseEntity<Projection> updateProjection(@PathVariable Integer id, @RequestBody ProjectionRequest projectionRequest) {
        try {
            Projection updatedProjection = projectionService.updateProjection(id, projectionRequest.getProjection());
            return ResponseEntity.ok(updatedProjection);
        } catch (EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @PatchMapping("/{id}")
    public ResponseEntity<Projection> partiallyUpdateProjection(@PathVariable Integer id, @RequestBody ProjectionRequest projectionRequest) {
        try {
            Projection updatedProjection = projectionService.partiallyUpdateProjection(id, projectionRequest.getProjection());
            return ResponseEntity.ok(updatedProjection);
        } catch (EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteProjection(@PathVariable Integer id) {
        try {
            projectionService.deleteProjection(id);
            return ResponseEntity.noContent().build();
        } catch (EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }


}
