package com.example.cinemaapp.seatType;

import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class SeatTypeService {
    private final SeatTypeRepository seatTypeRepository;

    public List<SeatType> getAllSeatTypes() {
        return seatTypeRepository.findAll();
    }

    public Optional<SeatType> getSeatTypeById(Integer id) {
        return seatTypeRepository.findById(id);
    }

    public Integer addSeatType(SeatType seatType) {
        SeatType savedSeatType = SeatType.builder()
                .id(seatType.getId())
                .name(seatType.getName())
                .cost(seatType.getCost())
                .build();
        return seatTypeRepository.save(savedSeatType).getId();
    }

    public SeatType updateSeatType(Integer id, SeatType seatType) {
        SeatType foundSeatType = seatTypeRepository.findById(id).orElseThrow(EntityNotFoundException::new);
        foundSeatType.setName(seatType.getName());
        foundSeatType.setCost(seatType.getCost());
        return seatTypeRepository.save(foundSeatType);
    }

    public SeatType partiallyUpdateSeatType(Integer id, SeatType seatType) {
        SeatType foundSeatType = seatTypeRepository.findById(id).orElseThrow(EntityNotFoundException::new);
        if (seatType.getName() != null) foundSeatType.setName(seatType.getName());
        if (seatType.getCost() != null) foundSeatType.setCost(seatType.getCost());
        return seatTypeRepository.save(foundSeatType);
    }

    public void deleteSeatType(Integer id) {
        if (!seatTypeRepository.existsById(id)) {
            throw new EntityNotFoundException();
        }
        seatTypeRepository.deleteById(id);
    }


}
