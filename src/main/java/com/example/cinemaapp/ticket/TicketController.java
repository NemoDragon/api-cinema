package com.example.cinemaapp.ticket;

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
@RequestMapping("/tickets")
@RequiredArgsConstructor
public class TicketController {
    @Autowired
    private TicketService ticketService;

    @GetMapping()
    public ResponseEntity<TicketResponse> getTickets() {
        List<Ticket> tickets = ticketService.getAllTickets();
        return ResponseEntity.ok(new TicketResponse(tickets));
    }

    @GetMapping("/{id}")
    public ResponseEntity<Ticket> getTicketById(@PathVariable Integer id) {
        Optional<Ticket> ticket = ticketService.getTicketById(id);
        return ticket.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> addTicket(@RequestBody TicketRequest ticketRequest) {
        Integer id = ticketService.addTicket(ticketRequest.getTicket());
        URI location = ServletUriComponentsBuilder.fromCurrentRequest()
                .path("/{id}")
                .buildAndExpand(id)
                .toUri();
        return ResponseEntity.created(location).build();
    }

    @PutMapping("/{id}")
    public ResponseEntity<Ticket> updateTickets(@PathVariable Integer id, @RequestBody TicketRequest ticketRequest) {
        try {
            Ticket updatedTicket = ticketService.updateTicket(id, ticketRequest.getTicket());
            return ResponseEntity.ok(updatedTicket);
        } catch (EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @PatchMapping("/{id}")
    public ResponseEntity<Ticket> partiallyUpdateTickets(@PathVariable Integer id, @RequestBody TicketRequest ticketRequest) {
        try {
            Ticket updatedTicket = ticketService.partiallyUpdateTicket(id, ticketRequest.getTicket());
            return ResponseEntity.ok(updatedTicket);
        } catch (EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteTicket(@PathVariable Integer id) {
        try {
            ticketService.deleteTicket(id);
            return ResponseEntity.noContent().build();
        } catch (EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }

}
