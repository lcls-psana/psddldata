@package Archon {

//------------------ ArchonConfigV1 ------------------
/* Class containing configuration data for CCDs using the Archon controller. */
@type ConfigV1
  [[type_id(Id_ArchonConfig, 1)]]
  [[config_type]]
  [[devel]]
{
  @const uint16_t FILENAME_CHAR_MAX = 256;

  char _config[FILENAME_CHAR_MAX] -> config [[shape_method(None)]]; /* The path to an acf file to use with the camera. */

  /* Constructor which takes values for every attribute */
  @init()  [[auto]];
}

} //- @package Archon
