package net.developia.online.services;

import java.sql.SQLException;
import java.util.List;

import net.developia.online.dto.CardDTO;

public interface CardService {
	List<CardDTO> getCardList() throws SQLException;
}