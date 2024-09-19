package com.example.cinemaapp.ticket;

import com.example.cinemaapp.projection.Projection;
import com.example.cinemaapp.seat.Seat;
import com.example.cinemaapp.user.User;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Table(name = "ticket")
public class Ticket {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "projection_id")
    private Projection projection;

    @ManyToOne
    @JoinColumn(name = "seat_id")
    private Seat seat;
}
