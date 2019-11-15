require("jquery-ui/ui/widgets/datepicker");

const initDatepicker = () => {
  $( "#search_date" ).datepicker({
    inline: true,
    sideBySide: true
  });
}

export default initDatepicker;
