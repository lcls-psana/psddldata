@package Archon {

//------------------ ArchonConfigV1 ------------------
/* Class containing configuration data for CCDs using the Archon controller. */
@type ConfigV1
  [[type_id(Id_ArchonConfig, 1)]]
  [[config_type]]
  [[devel]]
{
  @const uint16_t FILENAME_CHAR_MAX = 256;
  
  @enum ReadoutMode (uint16_t) {
    Single     = 0,
    Continuous = 1,
    Triggered  = 2,
  }

  ReadoutMode _readoutMode -> readoutMode;
  uint16_t _sweepCount -> sweepCount;
  uint32_t _integrationTime -> integrationTime;
  uint32_t _nonIntegrationTime -> nonIntegrationTime;
  //-------- Image Formatting parameters --------
  uint32_t _preSkipPixels -> preSkipPixels;
  uint32_t _pixels -> pixels;
  uint32_t _postSkipPixels -> postSkipPixels;
  uint32_t _overscanPixels -> overscanPixels;
  uint16_t _preSkipLines -> preSkipLines;
  uint16_t _lines -> lines;
  uint16_t _postSkipLines -> postSkipLines;
  uint16_t _overScanLines -> overScanLines;
  uint16_t _horizontalBinning -> horizontalBinning;
  uint16_t _verticalBinning -> verticalBinning;
  //-------- Timing Parameters --------
  uint16_t _rgh     ->  rgh;
  uint16_t _rgl     ->  rgl;
  uint16_t _shp     ->  shp;
  uint16_t _shd     ->  shd;
  uint16_t _st      ->  st;
  uint16_t _stm1    ->  stm1;
  uint16_t _at      ->  at;
  uint16_t _dwell1  -> dwell1;
  uint16_t _dwell2  -> dwell2;
  //-------- Constants - Clock Level --------
  int16_t _rgHigh -> rgHigh;
  int16_t _rgLow  -> rgLow;
  int16_t _sHigh  -> sHigh;
  int16_t _sLow   -> sLow;
  int16_t _aHigh  -> aHigh;
  int16_t _aLow   -> aLow;
  //-------- Constants - Slew Rates --------
  int16_t _rgSlew -> rgSlew;
  int16_t _sSlew  -> sSlew;
  int16_t _aSlew  -> aSlew;

  char _config[FILENAME_CHAR_MAX] -> config [[shape_method(None)]]; /* The path to an acf file to use with the camera. */

  /* Constructor which takes values for every attribute */
  @init()  [[auto]];
}

} //- @package Archon
