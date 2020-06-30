import "bootstrap";
import flatpickr from "flatpickr";
import 'mapbox-gl/dist/mapbox-gl.css';
import "../plugins/init_flatpickr.js"

import { initMapbox } from '../plugins/init_mapbox';
import { dashboardSelection } from "./user_dashboard";
import { userUpdateModal } from "./user_update_modal";
import { updateEditModal } from "./modal_aircraft_form";

initMapbox();
dashboardSelection();
userUpdateModal();
updateEditModal();


