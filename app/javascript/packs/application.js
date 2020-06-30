import "bootstrap";
import flatpickr from "flatpickr";
import 'mapbox-gl/dist/mapbox-gl.css';
import "../plugins/init_flatpickr.js"

import { initMapbox } from '../plugins/init_mapbox';
import { dashboardSelection } from "./user_dashboard";
import { userEditModal } from "./user_edit_modal";
import { aircraftEditModal } from "./aircraft_edit_modal";

initMapbox();
dashboardSelection();
userUpdateModal();
aircraftEditModal();


