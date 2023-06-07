class CascadingDropdowns {
  constructor(filters = []) {
    this.filters = filters;
    this.bindEvents();
  }

  bindEvents() {
    // Event handler for site select change
    $(".site-select").on("change", () => {
      const siteId = $(".site-select").val();
      this.loadSiteAreas(siteId);
    });

    // Event handler for site area select change
    $(".site-area-select").on("change", () => {
      const siteAreaId = $(".site-area-select").val();
      this.loadSiteRooms(siteAreaId);
    });
  }

  loadSiteAreas(siteId) {
    $.ajax({
      type: "GET",
      url: "/sites/site_areas_by_site",
      data: { site_id: siteId },
      dataType: "json",
      success: (data) => {
        const filteredData = this.applyFilters(data);
        const options = filteredData.map((siteArea) =>
          `<option value="${siteArea.SiteAreaID}">${siteArea.AreaCommonName}</option>`
        );
        $(".site-area-select").html(options);
      },
    });
  }

  loadSiteRooms(siteAreaId) {
    $.ajax({
      type: "GET",
      url: "/site_areas/site_rooms_by_area",
      data: { site_area_id: siteAreaId },
      success: (data) => {
        const filteredData = this.applyFilters(data);
        const options = filteredData.map((siteRoom) =>
          `<option value="${siteRoom.SiteRoomID}">${siteRoom.RoomCommonName}</option>`
        );
        $(".site-room-select").html(options);
      },
    });
  }

  applyFilters(data) {
    if (this.filters.includes("IsVibrationAnalyzed")) {
      return data.filter((item) => item.RotatingAssetsPresent === true);
    }
    console.log(data);
    return data;
  }
}
