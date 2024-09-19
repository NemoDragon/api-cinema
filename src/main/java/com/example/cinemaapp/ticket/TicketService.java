package com.example.cinemaapp.ticket;

import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class TicketService {
    private final TicketRepository ticketRepository;

    public List<Ticket> getAllTickets() {
        return ticketRepository.findAll();
    }

    public Optional<Ticket> getTicketById(Integer id) {
        return ticketRepository.findById(id);
    }

    public Integer addTicket(Ticket ticket) {
        Ticket savedTicket = Ticket.builder()
                .id(ticket.getId())
                .user(ticket.getUser())
                .projection(ticket.getProjection())
                .seat(ticket.getSeat())
                .build();
        return ticketRepository.save(savedTicket).getId();
    }

    public Ticket updateTicket(Integer id, Ticket ticket) {
        Ticket foundTicket = ticketRepository.findById(id).orElseThrow(EntityNotFoundException::new);
        foundTicket.setUser(ticket.getUser());
        foundTicket.setProjection(ticket.getProjection());
        foundTicket.setSeat(ticket.getSeat());
        return ticketRepository.save(foundTicket);
    }

    public Ticket partiallyUpdateTicket(Integer id, Ticket ticket) {
        Ticket foundTicket = ticketRepository.findById(id).orElseThrow(EntityNotFoundException::new);
        if (ticket.getUser() != null) foundTicket.setUser(ticket.getUser());
        if (ticket.getProjection() != null) foundTicket.setProjection(ticket.getProjection());
        if (ticket.getSeat() != null) foundTicket.setSeat(ticket.getSeat());
        return ticketRepository.save(foundTicket);
    }

    public void deleteTicket(Integer id) {
        if (!ticketRepository.existsById(id)) {
            throw new EntityNotFoundException();
        }
        ticketRepository.deleteById(id);
    }


}
