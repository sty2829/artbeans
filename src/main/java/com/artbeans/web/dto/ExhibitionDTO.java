package com.artbeans.web.dto;

import java.util.Date;

import com.artbeans.web.entity.FileInfo;
import com.artbeans.web.entity.GalleryInfo;
import com.artbeans.web.entity.ReservationInfo;
import com.artbeans.web.entity.UserInfo;

public interface ExhibitionDTO {

    Integer getEiNum();

    String getEiName();

    Integer getEiCharge();

    String getEiArtist();
 
    String getEiContent();

    Integer getEiBanner();

    Date getEiStartDate();

    Date getEiEndDate();

    String getEiStartTime();

    String getEiEndTime();

    String getEiStatus();

    Date getCredat();

    Date getModdat();

    GalleryInfo getGalleryInfo();
	
    FileInfo getFileInfo();

    UserInfo getUserInfo();

    ReservationInfo getReservationInfo();

}
