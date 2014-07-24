-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 24-07-2014 a las 04:58:44
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `turismo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Atractivos_Secanos`
--

CREATE TABLE IF NOT EXISTS `Atractivos_Secanos` (
  `ID_Atractivo` int(11) NOT NULL,
  `ID_Atractivo_Sercano` int(11) DEFAULT NULL,
  `Distancia` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Atractivo`),
  KEY `FK_Reference_26` (`ID_Atractivo_Sercano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Atractivos_Secanos`
--

INSERT INTO `Atractivos_Secanos` (`ID_Atractivo`, `ID_Atractivo_Sercano`, `Distancia`) VALUES
(1, 2, 3),
(2, 1, 5),
(3, 7, 1),
(4, 10, 400),
(5, 10, 400),
(6, 10, 400),
(9, 10, 400),
(15, 15, 500),
(17, 18, 3),
(18, 19, 3),
(19, 18, 0),
(21, NULL, 0),
(27, 19, 0),
(28, 18, 2),
(29, 41, 6),
(32, 8, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Atractivo_Categoria`
--

CREATE TABLE IF NOT EXISTS `Atractivo_Categoria` (
  `ID_Atractivo_Categoria` int(10) NOT NULL AUTO_INCREMENT,
  `A_Categoria` mediumtext,
  `Detalle_A_Categoria` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ID_Atractivo_Categoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Incorpora las categorías que existen de los sitios turistico' AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `Atractivo_Categoria`
--

INSERT INTO `Atractivo_Categoria` (`ID_Atractivo_Categoria`, `A_Categoria`, `Detalle_A_Categoria`) VALUES
(1, 'Sitios Naturales       ', 'Sin Dato'),
(2, 'Manifestación cultural', 'Sin Dato'),
(3, 'Manifestación Natural', 'Sin Dato'),
(4, 'Sitio', 'Sin Dato');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Atractivo_Detalle`
--

CREATE TABLE IF NOT EXISTS `Atractivo_Detalle` (
  `ID_Atractivo_Subtipo` int(10) NOT NULL,
  `ID_Atrat_tipo` int(10) NOT NULL,
  `ID_Atractivo_Turistico` int(11) NOT NULL,
  `ID_Atractivo_Categoria` int(10) NOT NULL,
  PRIMARY KEY (`ID_Atractivo_Subtipo`,`ID_Atrat_tipo`,`ID_Atractivo_Turistico`,`ID_Atractivo_Categoria`),
  KEY `FK_Reference_291` (`ID_Atractivo_Categoria`),
  KEY `FK_Reference_31` (`ID_Atrat_tipo`),
  KEY `FK_Reference_32` (`ID_Atractivo_Turistico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Atractivo_Detalle`
--

INSERT INTO `Atractivo_Detalle` (`ID_Atractivo_Subtipo`, `ID_Atrat_tipo`, `ID_Atractivo_Turistico`, `ID_Atractivo_Categoria`) VALUES
(1, 1, 1, 1),
(1, 1, 2, 1),
(1, 1, 17, 1),
(1, 1, 21, 1),
(1, 1, 22, 1),
(1, 1, 28, 1),
(3, 1, 4, 1),
(3, 1, 5, 1),
(3, 1, 6, 1),
(3, 1, 10, 1),
(4, 3, 9, 1),
(4, 3, 37, 1),
(9, 9, 38, 1),
(11, 1, 23, 1),
(2, 2, 3, 2),
(6, 5, 7, 2),
(6, 5, 14, 2),
(7, 7, 18, 2),
(7, 7, 26, 2),
(8, 5, 19, 2),
(9, 6, 20, 2),
(13, 8, 27, 2),
(15, 6, 29, 2),
(15, 6, 30, 2),
(1, 1, 16, 3),
(1, 1, 39, 3),
(2, 1, 13, 3),
(3, 1, 12, 3),
(10, 1, 15, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Atractivo_Subtipo`
--

CREATE TABLE IF NOT EXISTS `Atractivo_Subtipo` (
  `ID_Atractivo_Subtipo` int(10) NOT NULL AUTO_INCREMENT,
  `ID_Atrat_tipo` int(10) DEFAULT NULL,
  `A_Subtipo` varchar(50) DEFAULT NULL,
  `Detalle_A_Subtipo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Atractivo_Subtipo`),
  KEY `FK_Reference_34` (`ID_Atrat_tipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Incorpora datos de los subtipos de atractivos turisticos' AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `Atractivo_Subtipo`
--

INSERT INTO `Atractivo_Subtipo` (`ID_Atractivo_Subtipo`, `ID_Atrat_tipo`, `A_Subtipo`, `Detalle_A_Subtipo`) VALUES
(1, 1, 'Cascadas', 'Sin Datos'),
(2, 2, 'Museos', 'SIN DATO'),
(3, 1, 'Cascadas, cataratas o Saltos', 'Sin Dato'),
(4, 3, 'Cueva', 'Sin Dato'),
(5, 2, 'Explotaciones agropecuarias', 'Sin Datos'),
(6, 5, 'Arquitectura Religiosa', 'SIN DATO'),
(7, 7, 'Centros científicos y técnicos.', 'Sin Datos'),
(8, 5, 'Arqueológica', 'Sin Datos'),
(9, 6, 'Artesanías', 'Sin Datos'),
(10, 1, 'Rio', 'Sin Dato'),
(11, 1, 'Cascadas, cataratas', 'Sin Dato'),
(12, 7, 'Explotación ranícola', 'Sin Datos'),
(13, 8, 'Sin Datos', 'Sin Datos'),
(14, 9, 'Laguna', 'Sin Dato'),
(15, 6, 'Grupos étnicos ', 'Sin Datos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Atractivo_Tipo`
--

CREATE TABLE IF NOT EXISTS `Atractivo_Tipo` (
  `ID_Atrat_tipo` int(10) NOT NULL AUTO_INCREMENT,
  `ID_Atractivo_Categoria` int(10) DEFAULT NULL,
  `Categoria_Tipo` varchar(100) DEFAULT NULL,
  `Descripcion_cat_tipo` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ID_Atrat_tipo`),
  KEY `FK_Reference_33` (`ID_Atractivo_Categoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='incorpora los Datos de los tipo que existen en las categoría' AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `Atractivo_Tipo`
--

INSERT INTO `Atractivo_Tipo` (`ID_Atrat_tipo`, `ID_Atractivo_Categoria`, `Categoria_Tipo`, `Descripcion_cat_tipo`) VALUES
(1, 1, 'Ríos', 'Sin Datos'),
(2, 2, 'Realizaciones artísticas contemporáneas', 'SIN DATO'),
(3, 1, 'Fenómenos Espeliológicos', 'Sin Dato'),
(4, 2, 'Manifestación Cultural', 'Sin Datos'),
(5, 2, 'Histórica', 'SIN DATO'),
(6, 2, 'Etnográfica', 'Sin Datos'),
(7, 2, 'Realizaciones Técnicas y científicas', 'Sin Datos'),
(8, 2, 'Sin Datos', 'Sin Datos'),
(9, 1, 'Ambiente lacustre', 'Sin Dato');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Atractivo_Turistico`
--

CREATE TABLE IF NOT EXISTS `Atractivo_Turistico` (
  `ID_Atractivo_Turistico` int(11) NOT NULL AUTO_INCREMENT,
  `Atractivo_Nombre` varchar(150) NOT NULL,
  `Atractivo_lat` varchar(50) DEFAULT NULL,
  `Atractivo_log` varchar(50) DEFAULT NULL,
  `Atractivo_Altura` int(10) DEFAULT NULL,
  `Atractivo_Temperatura` varchar(10) DEFAULT NULL,
  `Atractivo_Pluviometrica` varchar(100) DEFAULT NULL,
  `Atractivo_Caracteristicas` text,
  `Atractivo_Fortalezas` text,
  `Atractivo_Debilidades` text,
  `Atractivo_Ventajas` text,
  `Atractivo_Amenazas` text,
  `Calle` varchar(200) DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  `Transversal` varchar(200) DEFAULT NULL,
  `Conservacion_Usos` text,
  `Concervacion_Estado` varchar(50) DEFAULT NULL,
  `Estado_Conser_Causas` text,
  `Entorno_Estado` text,
  `Esta_Entor_Causas` text,
  PRIMARY KEY (`ID_Atractivo_Turistico`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Datos Generales de un Atractivo Turistico' AUTO_INCREMENT=45 ;

--
-- Volcado de datos para la tabla `Atractivo_Turistico`
--

INSERT INTO `Atractivo_Turistico` (`ID_Atractivo_Turistico`, `Atractivo_Nombre`, `Atractivo_lat`, `Atractivo_log`, `Atractivo_Altura`, `Atractivo_Temperatura`, `Atractivo_Pluviometrica`, `Atractivo_Caracteristicas`, `Atractivo_Fortalezas`, `Atractivo_Debilidades`, `Atractivo_Ventajas`, `Atractivo_Amenazas`, `Calle`, `Numero`, `Transversal`, `Conservacion_Usos`, `Concervacion_Estado`, `Estado_Conser_Causas`, `Entorno_Estado`, `Esta_Entor_Causas`) VALUES
(1, 'Cascadas Las escondidas', '-78.86698333333334', '5', 1031, '14-17 ', 'Sin Datos', 'Las escondidas son tres pequeñas cascadas que se  encuentran a 15 minutos de la parroquia La Paz hasta donde llega el carro, luego se camina alrededor de 20 minutos. Hay un sendero que en algunas partes esta dañado por las fuertes lluvias, y en otros tramos hay que caminar por encima se unos troncos para poder seguir. Antes de llegar a la primera de las tres cascadas hay una cabaña en la que hay adecuaciones como para descansar ya que tiene unos pequeños troncos para tomar asiento, por lo general  la comunidad lo utiliza para cocinar o tomar un refrigerio.  ', 'Cascadas se ubican cerca de la parroquia de la paz.  Adecuaciones para recibir a los turistas. ', 'No hay señalización para llegar a las cascadas. No hay sendero definido ', 'Gobierno  parroquial trabajando en proyectos turísticos en convenio con la UTPL. ', 'Condiciones climáticas deterioran el acceso al lugar', 'Sin Datos', 0, 'Sin Datos', 'Las cascadas son aptas para  tomar un baño y hacer caminatas a su alrededor.  Este lugar es visitado por las escuelas de la parroquia y del cantón. ', 'Conservado', 'Sin Datos', 'Entorno Conservado', 'Factores climáticos'),
(2, 'Cascadas Tekendama', '-3.733366666666667', '-78.89123333333333', 944, '14-17', 'Sin Datos', 'Para llegar a las cascadas Tekendama son 7km  hasta donde llega el carro, luego es una hora de caminata.  Cuenta con un sendero  por el cual se camina alrededor de 10 minutos, luego se pasa por un puente para atravesar el rio, luego sigue el sendero, el mismo que se ha dañado debido a las condiciones climáticas.  ', 'Lugar con abundante presencia de naturaleza', 'No hay accesibilidad hasta la cascada. ', 'Interés del gobierno parroquial por trabajar en proyectos de turismo', 'Cascadas cercanas con mejor accesibilidad.', 'Sin Datos', 0, 'Sin Datos', 'El acceso hasta el atractivo esta deteriorado por las malas condiciones climáticas. ', 'Alterado', 'Sin Datos', 'Entorno Alterado', ' Factores climáticos '),
(3, 'Museo Petrominero y Antropomorfo', '-4.079756', '-78.953383', 1040, '15', 'SIN DATO', 'El museo se ubica dentro del colegio Monseñor Joral Mosquera Barreiro, consta de una sala\r\namplia e instalaciones de baño, además se está adecuando un área de lavado para las rocas y\r\nutensilios que se van encontrando en la zona y llevando a la exposición.\r\nEn el museo se puede encontrar exposición de maquetas que demuestran las actividades\r\ndesarrolladas por la actividad minera, colección de rocas, minerales, rocas con oro acuíferas,\r\ngemas semipreciosas, las mismas que son de Zamora, Nangaritza, Brazil. Además\r\nrepresentaciones históricas, y una representación de las viviendas Shuar en maqueta y tamaño\r\nreal.\r\nEl museo no pasa abierto pero se pueden comunicar con el rector para las visitas en el\r\nsiguiente horario 08h00 a 16h00.', 'Cuenta con una variedad de piezas para la\r\nexhibición\r\nSu ubicación es a junto a la vía.\r\nHay nuevas adecuaciones.', 'Solo el rector del colegio donde funciona\r\nconoce la información de las exhibiciones.\r\nNo pasa abierto al público.\r\nNo cuenta con señaletica sobre el museo, ni tampoco en el interior.', 'Es el único museo de la zona.\r\nPresencia de empresas mineras\r\nCooperación entre la junta parroquial y\r\nempresas mineras', 'Desconocimiento de su existencia.', 'Vía principal a Nambija', 0, 'SIN DATO', 'El museo esta conservado porque está dentro de un colegio, y no pasa abierto al público.\r\nORGANIZACIÓN Y CUMPLIMIENTO (ACONTECIMIENTOS PROGRAMADOS)', 'CONSERVADO', 'SIN DATO', 'CONSERVADO', 'SIN DATO'),
(4, 'Cascada Hombre Shuar', 'Sin Dato', 'Sin Dato', 1069, '10-12', 'Sin Dato', 'Continuado por el sendero de la cascada la Misteriosa 700 metros más adelante, se encuentra la cascada llamada el hombre Shuar, su caída de agua es de aproximadamente 20metros, y en su caída de agua forma una laguna en donde se puede dar un refrescante baño, el sendero que conduce al lugar es demasiado estrecho, prácticamente es una trocha y el terreno es bastante irregular y rocoso, lo que dificulta la vista de turistas a este atractivo.', 'Esta cascada se encuentra y cerca de la parroquia Chicaña.\r\n', 'No existe sendero, solo trocha, No son senderos auto guiados, No posee señaletica.\r\nAcceso rocoso y peligroso\r\nEl gobierno parroquial posee recursos económicos escasos para mejorar los atractivos turísticos.\r\n', 'Autoridades parroquiales y cantonales interesados en mejorar y difundir el potencial turístico de la zona.\r\nAprovechar la vista la presencia de empresas mineras en la zona para solicitar financiamiento de proyectos.', 'Contaminación del sendero con residuos y con grafitis.\r\nDeterioro de la naturaleza, Tráfico de flora y fauna.', 'Sin Dato', 0, 'Sin Dato', 'El atractivo se encuentra en estado conservado por el momento.\r\n', 'Conservado', 'Sin Dato', 'Conservado', 'Sin Dato'),
(5, 'Ruta la Luna', 'Sin Dato', 'Sin Dato', 2117, '10-12', 'Sin Dato', 'La cascada la luna se encuentra a tan solo 5 minutos a pie desde la entrada, la caída de agua es de 20 metros aproximadamente, posee un sendero en estado deteriorado, de la misma manera posee basureros, pero existe contaminación en el lugar debido a que no hay buen manejo de la basura.\r\n En el entorno se observa mucha naturaleza, con la presencia de flora típica del lugar y se escucha el silbido de aves.', 'Esta cascada se encuentra muy cerca de la parroquia Chicaña.\r\nVisita frecuente de residentes y turistas los fines de semana y feriados\r\n', 'El  sendero se encentra deteriorado.\r\nNo son senderos auto guiados\r\nNo posee señaletica.\r\nEl gobierno parroquial posee recursos económicos escasos para mejorar los atractivos turísticos."\r\n', 'Autoridades parroquiales y cantonales interesados en mejorar y difundir el potencial turístico de la zona.\r\nAprovechar la vista la presencia de empresas mineras en la zona para solicitar financiamiento de proyectos.\r\n', 'Contaminación del sendero con residuos y con grafitis.\r\nDeterioro de la naturaleza \r\nTráfico de flora y fauna."\r\n', 'Sin Dato', 0, 'Sin Dato', 'El atractivo se encuentra en estado conservado por el momento.\r\n', 'Conservado', 'Sin Dato', 'Conservado', 'Sin Dato'),
(6, 'Cascada Misteriosa', 'Sin Dato', 'Sin Dato', 1017, '10-12', 'Sin Dato', 'En el mismo sector de los Guayacanes, caminando 200 metros desde la entrada se encuentra una de hermosa cascada que posee 32 metros de caída de agua, el paisaje que le rodea es hermoso llenos de flora típica del lugar.\r\n', 'Esta cascada se encuentra muy cerca de la parroquia Chicaña.\r\nVisita frecuente de residentes y turistas los fines de semana y feriados"\r\n', 'El  sendero se encentra deteriorado.\r\nNo son senderos auto guiados.\r\nNo posee señalética.\r\nEl gobierno parroquial posee recursos económicos escasos para mejorar los atractivos turísticos.\r\n', 'Autoridades parroquiales y cantonales interesados en mejorar y difundir el potencial turístico de la zona.\r\nAprovechar la vista la presencia de empresas mineras en la zona para solicitar financiamiento de proyectos.\r\n', 'Contaminación del sendero con residuos y con grafitis.\r\nDeterioro de la naturaleza,tráfico de flora y fauna"\r\n', 'Sin Dato', 0, 'Sin Dato', 'Sin Dato', 'Conservado', 'Sin Dato', 'Conservado', 'Sin Dato'),
(7, 'Iglesia de San Carlos de las Minas', '-4.025285', ' -78.824482', 1046, '15', 'SIN DATO', 'La iglesia se ubica en el centro de la parroquia, al frente de la misma se encuentra una pequeña plaza, y\r\na lado la casa de la curia. Esta iglesia permanece cerrada.', 'Se ubica en el centro de la parroquia,\r\nSus alrededores son limpios.', 'No pasa abierta.', 'NO POSEE', 'Iglesias con mayor representatividad cercanas.', 'SIN DATO', 0, 'SIN DATO', 'El entorno esta conservado, hay una plaza, tiendas, escuelas y colegios. El lugar es limpio. Las\r\ncalles a su alrededor son adoquinadas.\r\nORGANIZACIÓN Y CUMPLIMIENTO (ACONTECIMIENTOS PROGRAMADOS)', 'CONSERVADO', 'SIN DATO', 'SIN DATO', 'SIN DATO'),
(8, 'Cascada Velo de novia', '-3.565333333333333', '-78.9701333333333', 1976, '13', 'Sin Datos', '"Cascada de la parroquia Tutupali, para llegar se debe caminar alrededor de 15 minutos por el sendero. En el lugar hay dos chozas para los turistas, además de tener una choza con dos mesas de madera y asientos de tronco Se puede llegar hasta la parte más baja de la\r\ncascada es decir hasta la laguna que forma su caída,  la misma que tiene una profundidad adecuada\r\npara poder tomar un baño.  para llevar  comida para preparar en el lugar. Tiene algunas adecuaciones para los turistas.  La cascada posee una majestuosa caída muy amplia y se puede observar bosque primario a su alrededor."', 'Ubicación Gran Caudal y caída Aguas Cristalinas', 'No hay señalización Entorno dañado por el clima ', 'Cuenta con adecuaciones Próxima apertura vía Yacuambi – Saraguro ', 'Condiciones climáticas dañan el acceso a la cascada', 'Via Yacuambi - Saraguro    ', 0, 'Sin Datos', 'Esta cascada es muy visitada por la gente de la zona, debido a su fácil acceso. ', 'Alterado', 'Fuertes lluvias', 'Entono Alterado', ' Factores climáticos '),
(9, 'Cueva de los Guayacanes', 'Sin Dato', 'Sin Dato', 2117, '10-12', 'Sin Dato', 'La cueva de los Guayacanes forma parte de la ruta turística del mismo nombre, aproximadamente tiene una altura de 6 metros y una  profundidad de 50 metros, en donde se puede observar estalactitas y estalagmitas y una especie de murciélagos.\r\n', 'Esta ruta turística se encuentra muy cerca de la parroquia Chicaña.\r\nVisita frecuente de residentes y turistas los fines de semana y feriados.\r\n', 'El  sendero se encentra deteriorado.\r\nNo son senderos auto guiados.\r\nNo posee señaletica.                                                                                                                                                                El gobierno parroquial posee recursos económicos escasos para mejorar los atractivos turísticos.\r\n', 'Autoridades parroquiales y cantonales interesados en mejorar y difundir el potencial turístico de la zona.\r\nAprovechar la vista la presencia de empresas mineras en la zona para solicitar financiamiento de proyectos.\r\n', 'Contaminación del sendero con residuos y con grafitis.\r\nDeterioro de la naturaleza y tráfico de flora y fauna."\r\n', 'Sin Dato', 0, 'Sin Dato', 'El atractivo se encuentra en estado conservado por el momento.', 'Conservado', 'Sin Dato', 'Conservado', 'Sin Dato'),
(10, 'Cascada Tobogán\r\n', 'Sin Dato', 'Sin Dato', 2117, '10-12', 'Sin Dato', 'La cascada Tobogán,se encuentra a cuatrocientos metros de la cascada acorazonada,  la caída de agua es de 10 metros aproximadamente,  posee paredes lisas.  \r\nEn el entorno se observa muchas naturaleza, con la presencia de flora típica del lugar y se escucha el silbido de aves.\r\n', 'Esta cascada se encuentra muy cerca de la parroquia Chicaña.\r\nVisita frecuente de residentes y turistas los fines de semana y feriados.\r\n', 'El  sendero se encentra deteriorado\r\nNo son senderos auto guiados\r\nNo posee señaletica.\r\nEl gobierno parroquial\r\nposee recursos económicos escasos para mejorar los atractivos turísticos.', 'Autoridades parroquiales y cantonales interesados en mejorar y difundir el potencial turístico de la zona.\r\nAprovechar la vista la presencia de empresas mineras en la zona para solicitar financiamiento de proyectos.\r\n', 'Contaminación del sendero con residuos y con grafitis.\r\nDeterioro de la naturaleza.\r\nTráfico de flora y fauna.\r\n', 'Sin Dato', 0, 'Sin Dato', 'El atractivo se encuentra en estado conservado por el momento.\r\n', 'Conservado', 'Sin Dato', 'Conservado', 'Sin Dato'),
(11, 'Centro de Ranicultura “La Rana Bonita 2”', 'W 078°52´932"', 'S 03°52´242"', 3, 'Sin Dato', 'Sin Dato', 'Este centro de ranicultura se encuentra en el Barrio Piuntza considerado el principal centro de producción y explotación de carne de rana en la provincia, este centro es de grandes dimensiones, se dedican a la producción de ranas y ranas toro, además de la producción de tilapia.', 'Lugar amplio.\r\nFácil accesibilidad', 'e señalización para ubicar el lugar.', 'Parroquia conocida por la producción de ranas.', 'Varios centros de ranicultura en la zona.', 'Piuntza', 0, 'Sin Dato', 'Sin Dato', 'Conservado', 'Sin Dato', 'Conservado', 'Sin Dato'),
(12, 'Cascada Mil Amores (San Miguel)', '-3.972705', ' -78.870992', 1040, '15', 'SIN DATO', 'Para llegar a la cascada son 15 km hasta donde llega el carro, luego 15 minutos de caminata\r\npor un sendero y 30 minutos por una brecha de camino que hubo que desmontar. La\r\naccesibilidad no es buena, La cascada tiene 8 metros de altura, y una fosa pequeña, en la roca\r\nde la cascada se puede observar una beta de oro. Esta cascada se encuentra en terrenos\r\nprivados. En el mismo lugar el dueño cuenta con una piscina de trucha.', 'El agua de la cascada es limpia.', 'Difícil acceso a la cascada.\r\nUbicadas en terreno privado.', 'AMENAZAS', 'Cascadas con mayor representatividad en la\r\nzona.', 'SIN DATO', 0, 'SIN DATO', 'El entorno es alterado, el clima por las fuertes lluvias había afectado pocas partes del mismo.\r\nORGANIZACIÓN Y CUMPLIMIENTO (ACONTECIMIENTOS PROGRAMADOS)', 'ALTERADO', 'Las fuertes lluvias.', 'ALTERADO', 'SIN DATO'),
(13, 'Cascada San Gregorio', '-4.051629', '-78.839062', 1176, '15', 'SIN DATO', 'Para llegar a la cascada son 5 km en carro, luego es una hora de caminata por el sendero el mismo que atraviesa nueve veces la quebrada, y hay que iras montando los últimos diez minutos, porque por las\r\nlluvias se ha dañado el sendero. La cascada tiene una altura aproximada de 80 metros.', 'Agua limpia.\r\nLaguna profunda que permite poder bañarse.\r\nTiene un tobogán natural.', 'Sendero y entorno de la cascada dañado por las\r\nfuertes lluvias.\r\nUbicación en terrenos privados.\r\nNo hay señalización', 'Se va abrir carretera que llega hasta unos diez\r\nminutos antes de la cascada.\r\nDueño presto a colaborar para desarrollar el\r\nsitio.', 'Hay cascadas con mejor accesibilidad y mejores\r\ncaracterísticas.', 'SIN DATO', 0, 'SIN DATO', 'El entorno ha sido alterado por la expansión agrícola y por los daños ocasionados por el clima.\r\nORGANIZACIÓN Y CUMPLIMIENTO (ACONTECIMIENTOS PROGRAMADOS)', 'CONSERVADO', 'SIN DATO', 'ALTERADO', 'Fuertes lluvias'),
(14, 'Iglesia de la misión Franciscana', '-3.846267', '-78.893933', 862, '19', 'SIN DATO', 'La iglesia de la Misión Franciscana fue construida en los años 80 la misma se encuentra\r\ndentro de la clínica misional de Guadalupe que abrió sus puertas en octubre de 2001, con el\r\nfin de ayudar a la gente de escasos recursos económicos. Cuenta con un edificio donde\r\nfuncionan las salas de exámenes, salas de odontología, un quirófano, una farmacia y un\r\nlaboratorio. La clínica ha tenido gran éxito a nivel nacional, y un apoyo incondicional de\r\norganizaciones internacionales. Actualmente llegan médicos voluntarios de países como:\r\nAlemania, Austria, Suiza, Francia y Estados Unidos, a los cuales les dan alojamiento y\r\nalimentación', 'Clínica misional conocida por su obra.\r\nLugar conservado y de fácil accesibilidad.', 'NO POSEE', 'Trabajo en conjunto con la junta.\r\nMovimiento interno y externo de personas por la\r\nactividad propia de clínica.', 'NO POSEE', 'SIN DATO', 0, 'SIN DATO', 'Es una clínica de la misión franciscana que actua como una fundación en ayuda a personas de escasos\r\nrecursos económicos.\r\nORGANIZACIÓN Y CUMPLIMIENTO (ACONTECIMIENTOS PROGRAMADOS)', 'CONSERVADO', 'SIN DATO', 'CONSERVADO', 'SIN DATO'),
(15, 'Rio Kantzama', 'W 078°53´747"', 'S 03°51´294"', 869, 'Sin Dato', 'Sin dato', 'Es el río más limpio de Guadalupe, ya que no ha presenciado la  intervención minera cerca del sector. Aquí mismo están las playas de Kantzama, denominado al pequeño conjunto recreativo que se encuentra cerca del río. Son aguas cristalinas y muy limpias, con canchas de multiuso y un lugar donde se puede cocinar su propia comida, equipada con mesas y sillas rústicas', 'Ubicación y accesibilidad\r\nRio y playas limpias', '"Sin señalización \r\nAdecuaciones en estado alterado."\r\n', 'Sin Dato', 'Falta de promoción del lugar.', 'Sin Dato', 0, 'Sin Dato', 'A este lugar lo utilizan como un balneario de recreación.', 'Conservado', NULL, 'Conservado', 'Sin Dato'),
(16, 'Cascada Las Bromelias-Feliz Ventura', '-3.7145', '-78.726194  ', 1069, '23', '2309.4 cm3', 'Para llegar a esta Cascada se debe caminar 15 minutos aguas arriba desde la cascada El Descanso a una distancia de 200 metros. El nombre es porque es la última cascada de esta ruta, se ubica en la parte más alta aguas arriba y al llegar se muestra la valentía y coraje del turista para recorrer esta ruta. La cascada tiene una altura aproximada de 10m, está conformada por dos caídas, la una la constituye la caída llamada Las Bromelias y la segunda llamada Feliz Ventura. Existe sendero, sin embargo el mismo necesita de mantenimiento.', 'Abundante caudal de agua.', 'Falta dar mantenimiento a los senderos', 'Fácil accesibilidad', 'Disminución del caudal en épocas de verano', 'Sin Dato', 0, 'Sin Dato', 'No existe ningún acontecimiento programado en el atractivo.', 'Conservado', 'Se encuentra dentro de bosque primario', 'Conservado', 'Por la presencia de bosque primario.'),
(17, 'Cascada Reina de El Cisne', '-3.712', '-78.686972', 1174, '23ºc', '2309.4 cm3', 'Su característica principal es su altura de 35 m. aproximadamente, su escenario es su hermosa caída caudalosa rodeada de una vegetación representativa del lugar, en sus aguas cristalinas se puede tomar un relajante baño, realizar sesiones fotográficas y observar aves propias del lugar.\r\n  \r\nEntre la flora y fauna que se puede apreciar esta: Guayacán, palmas, canelos, laurel y varias especies de orquídeas, animales, como: guanchacas, especies de ranitas pequeñas, tigrillos, conejos y otros.\r\n  \r\n  Es importante recalcar que la vegetación que la vegetación propia del lugar se mantiene únicamente en la caída de la cascada y en la quebrada que da origen la misma cascada. El resto de terreno ha sido convertido en áreas de pastizales por la expansión agrícola.', 'La altura y el caudal de la cascada\r\n Remanente de bosque primario', 'Expansión agrícola en la cercanía al atractivo', 'Fácil accesibilidad al atractivo por la cercanía de la carretera', 'Expansión agrícola\r\n La cascada se encuentra en propiedad privada', 'Sin Dato', 0, 'Sin Dato', 'En el atractivo no se realiza ningún tipo de evento, el sector ha sido destinado como zona se pastizales, producto de la deforestación', 'Alterado', 'Por la expansión agrícola', 'Alterado', 'Por la expansión agrícola.'),
(18, 'CEDEMAZ', '-3.744639 ', '-3.744639', 0, '23ºc', '2309.4 cm3', 'El Centro de Estudios y Desarrollo de la Amazonía-CEDEMAZ , se enmarca en el desarrollo económico, social y organizacional de la Amazonía, coordinando y ejecutando proyecto s interdisciplinarios de investigación, y facilita y apoya desde la academia a los gobiernos locales. Se encuentra trabajando en programas sobre:\r\n \r\n Especies animales nativas\r\n Frutales nativos amazónicos dela región sur del Ecuador.\r\n Desarrollo y producción animal y forrajes\r\n Conservación y producción de servicios ecosistémicos\r\n Apoyo al desarrollo turístico\r\n Programa de regeneración, aprovechamiento y conservación de bosques.\r\n Programa de plantas medicinales.', 'Existencia de proyectos de investigación y presencia de bosque primario', 'Escaza participación de otras instituciones y organismos', 'La ubicación y extensión', 'Falta de proyectos para abordar toda la extensión', 'Sin Dato', 0, 'Sin Dato', 'No se realiza ninguna.', 'Conservado', 'Por la  intervención de los  proyectos que se están llevando a cabo', 'Conservado', 'Tiene un alto porcentaje de bosque primario que se encuentra conservado.'),
(19, 'Petroglifo de Padmi', '-3.738861', '-78.616778', 1045, '23ºc', '2309.4 cm3', 'El petroglifo se encuentra en una piedra, en los terrenos del proyecto CEDEMAZ de la Universidad Nacional de Loja, no existen estudios del petroglifo, está a 1 Km., de la troncal amazónica', 'Cercanía a la vía principal.', 'No existen estudios del atractivo.', 'Estar ubicado dentro del proyecto CEDEMAZ', 'Las condiciones climáticas', 'Sin Dato', 0, 'Sin Dato', 'No se realiza ningún acontecimiento entorno al atractivo.', 'Alterado', 'La piedra en la que se encuentra el petroglifo ha sido roto en uno de sus extremos', 'Alterado', 'El entorno del atractivo ha sido destinado a zona de cultivos'),
(20, 'Proyecto Sericultura', '-3.766611', '-78.695278', 798, '23ºc', '2309.4 cm3', 'La elaboración del Tejido de Gusano de Seda, es promovida por el interés propio de la familia Morales que con el apoyo de Organizaciones internacionales como el Instituto Italo Latino Americano IILA, apoya con capacitaciones para la producción de la misma. La hacienda, se encuentra ubicada a 21 km. de la ciudad de Yantzaza. La familia Morales, se dedica a la producción de tejidos de gusano de seda desde 1998 realizando su apertura oficial el 30 de Agosto del mismo año, con la asociación ISMI, iníciales del nombre del hermano mayor de esta familia (Iván Sergio Morales Iñiguez).Para obtener el tejido de gusano de seda, se sigue un proceso cuidadoso. Primeramente se deja secar el capullo durante 5 días, luego se prosigue a cocinar durante 30 a 40 minutos, en donde se irá desprendiendo el hilo. Cabe destacar que durante su desprendimiento, se distinguirá tres tipos de hilo: el de fibra continua, corta e hilo de chalp. Para obtener los colores para el tejido se lo hace con colorantes naturales', 'Emprendimiento familiar.', 'Poca producción', 'Interés en capacitarse y extender el negocio.', 'La llegada de todos los gusanos de seda vivos.', 'Interoceánica', 0, 'Sin Dato', 'Producción familiar. Se comercializa en el mismo establecimiento, debido a su bajo producción.', 'Conservado', 'Se realiza la producción de manera artesanal.', 'Conservado', 'Se encuentra en la vía la Troncal amazónica.	'),
(21, 'Cascada La Llana', 'Sin Dato', 'Sin Dato', 47, 'Sin Dato', 'Sin Dato', 'Sin Dato', 'Sin Dato', 'Sin Dato', 'Sin Dato', 'Sin Dato', 'Sin Dato', 1, 'Sin Dato', 'Sin Dato', 'Sin Dato', 'Sin Dato', 'Deteriorado', 'Sin Dato'),
(22, 'Cascada Las Yamalas', 'Sin Dato', 'Sin Dato', 40, 'Sin Dato', 'Sin Dato', 'Sin Dato', 'Sin Dato', 'Sin Dato', 'Sin Dato', 'Sin Dato', 'Sin Dato', 0, 'Sin Dato', 'Sin Dato', 'Sin Dato', 'Sin Dato', 'Alterado', 'El acceso se lo realiza subiendo la quebrada, hay mucha piedra que impide acceder sin complicación. Además el mal tiempo es un enemigo constante porque incluso se debe escalar sujetándose de las ramas de los árboles y es muy peligroso.'),
(23, 'Cascada Acorazonada', 'Sin Dato', 'Sin Dato', 0, 'Sin Dato', 'Sin Dato', 'La cascada acorazonada  se encuentra a quinientos metros de la cascada la luna,  la caída de agua es de 10 metros aproximadamente,  su nombre  es dado por la forma de corazón que tiene la laguna que se forma  al final de la laguna, donde se puede disfrutar de  estas aguas refrescantes posee un sendero en estado deteriorado y el algunas paredes rocosas con gratis. En el entorno se observa mucha  naturaleza, con la presencia de flora típica del lugar y se escucha el silbido de aves.', 'Esta cascada se encuentra muy cerca de la parroquia Chicaña.\r\nVisita frecuente de residentes y turistas los fines de semana y feriados', 'El  sendero se encentra deteriorado\r\nNo son senderos auto guiados\r\nNo posee señaletica.\r\nEl gobierno parroquial posee recursos económicos escasos para mejorar los atractivos turísticos.', 'Autoridades parroquiales y cantonales interesados en mejorar y difundir el potencial turístico de la zona.\r\nAprovechar la vista la presencia de empresas mineras en la zona para solicitar financiamiento de proyectos.', 'Contaminación del sendero con residuos y con grafitis.\r\nDeterioro de la naturaleza \r\nTráfico de flora y fauna.', 'Sin Dato', 0, 'Sin Dato', NULL, 'Conservado', 'Sin Dato', 'Conservado', 'Sin Dato'),
(26, 'Ranario Ecoranita', '-3.771388889', '-78.65038889', 1335, 'Sin Dato', 'Sin Dato', 'El Ranario Ecoranita, cuyo propietario es el Sr. Lénin Merino, exporta 4000 ranas  al mes a Estados Unidos, en temporada alta  y en temporada baja exportan 2000 ranas. Para la crianza de rana se siguen dos fases, acuática y fase terrestre. En la cual se necesita de mucho cuidado y atención debido a que son animales muy delicados.', 'Alta producción por temporada.', 'Mejorar la presentación del lugar.', 'Conocimiento en el exterior de la marca y producción.', 'Baja cultura gastronómica del consumo de las ranas a nivel provincial y nacional.', 'Troncal amazónica', 0, 'Sin Datos', 'La exportación está determinada por la temporada, dividiéndose en seis meses cada una', 'Deteriorado', 'Hace  falta mejorar la imagen del lugar', 'Conservado', 'El  Ranario se encuentra en  la troncal amazónica.'),
(27, 'Tola de Antas', '-3.78925', ' -78.61461111', 1300, '23c', '2309.4 cm3', 'El petroglifo de Padmi se encuentra cercano al Centro de Estudios y Desarrollo de la Amazonía-CEDEMAZ , está en propiedad privada, en la Tola se ha construido la antena la radio, lo que impacta a la vista, teniendo una altura de 50 cm.', 'Disposición de dueños del terreno en donde se encuentra la tola.', 'No existen estudios', 'La ubicación y extensión', 'Falta de interés por parte de las autoridades locales.', 'Sin Datos', 0, '0', 'No se realiza ninguna.', 'Alterado', 'Por la  construcción de la entena.', 'Conservado', 'Existencia de casas y potreros.'),
(28, 'Cascada sin nombre', '-3.781222222', '-78.64127778', 1047, '23°c', '2309.4', 'Es  una  amplia cascada, de gran caudal, posee dos caídas,  no es posible  realizar ningún tipo de actividad turística, puesto  que en  la cascada se realiza la captación de agua para la junta parroquial.\r\n', 'Abundante  caudal\r\n', 'Sirve de captación de agua para la junta parroquial', 'Fácil  accesibilidad', 'No es posible  realizar actividades  turísticas', 'Sin Datos', 0, 'Sin Datos', 'Se realiza la captación permanente de agua para la junta parroquial.', 'Alterado', 'Se la ha canalizado para la captación de agua .', 'Conservado', 'Se encuentra dentro de bosque primario.'),
(29, 'Comunidad Napurak ', '-3.748333333 ', '-78.86721667', 980, '15', '0', 'Napura es una comunidad Shuar, ubicada  cerca a la Parroquia La Paz su acceso es cerca a la vía, esta comunidad tiene apertura a recibir turistas, se les debe avisar con anticipación de la visita y ellos preparan un gran recibimiento que consta de una visita por toda la comunidad, danzas típicas, comida típica y venta de artesanías. La comunidad trabaja en la agricultura y crianza de tilapia. ', 'Ubicación de la comunidad\r\nComunidad organizada', 'No conservan su cultura habitualmente. ', 'Cooperación con el gobierno parroquial. . ', 'Desconocimiento de la actividad turística. ', 'Sin Datos', 0, 'Sin Datos', 'Las viviendas de la comunidad  no conservan el estilo Shuar, se han adaptado al estilo del resto de la localidad. ', 'Conservado', 'Sin Datos', 'Conservado', 'Sin datos'),
(30, 'Comunidad  Chapimza', '-3.77515', '-78.8543', 1124, '0', '0', 'Esta comunidad es de la etnia Saraguro, en el barrio Chapimza Alto,  esta comunidad mantiene sus costumbres en la vestimenta, además se pueden encontrar artesanías propias de la cultura.  ', 'Comunidad organizada.\r\nUbicación y accesibilidad. \r\n', 'Comunidad que va perdiendo su cultura', 'Cooperación con el gobierno parroquial', 'No hay actividades turísticas a realizarse', 'Sin Datos', 0, '0', 'ORGANIZACIÓN Y CUMPLIMIENTO (ACONTECIMIENTOS PROGRAMADOS)\r\nPara visitar esta comunidad se debe avisar con anticipación. Para poder observar sus artesanías. \r\n', 'Conservado', 'Sin datos', 'Conservado', 'Sin Datos'),
(32, 'Cascada Santa Clotilde', '-3.56533333333', '-78.97013333333', 1436, '13', 'Sin Datos', 'A esta cascada se la conoce también con el nombre de cascada Tres chorreras, la entrada a la cascada es en la vía a Tutupali,  a unos 15 minutos desde Tutupali hasta la entrada, luego son alrededor de 30 minutos que se deben caminar, tiene un sendero el mismo que se debe adecuar. Al llegar a la cascada se puede sentir la brisa de la misma estando aun a unos pocos metros, se puede acceder hasta la parte más baja. Es una Cascada que forma varios saltos de agua, que en su conjunto tiene una diferencia de 400 metros. El último salto es de más o menos de 150 metros que cae formando estelas sobre una laguna', 'Características de la cascada. Ubicación  Agua cristalina Belleza paisajística. ', 'Sendero Sin señalización No cuenta con ningún tipo de adecuación para los visitantes ', 'Junta parroquiales trabajando en nuevos proyectos turísticos. ', 'Condiciones climáticas ', 'Sin datos', 0, 'Sin datos', 'Sin datos', 'Conservada', 'Sin datos', 'Entorno Alterado', 'Factores Climaticos'),
(36, 'Cascada del oso', '-3.680472', '-78.704444', 1172, '23', '2309.4 cm3\r\n', 'Es una de las cascadas más bellas del lugar, está ubicada en la parroquia Chicaña, al igual que un conjunto de cascadas de esta zona, posee una altura de 40 m de altura aproximadamente, lo inquietante de esta cascada es su caída de agua por tramos, haciendo de este, un escenario majestuoso, sus aguas cristalinas, permiten bañarse en ellas. “se dice que el que se baña en este lugar es dotado gran fuerza y energía”, esto se basa en una leyenda contada por los pobladores, se dice que se bebe del agua en los rituales de shamanes que realizaban antes de ir de casería.Junto a todo esto, el escenario de biodiversidad de la zona, llama la atención a propios y a extraños, pues está dentro del bosque primario.\r\n', 'Dispone de gran cantidad de agua,Está ubicada dentro del bosque primario\r\n', 'No hay sendero definido\r\n', 'Pocas personas la conocen, lo que favorece su conservación\r\n', 'Se encuentra en propiedad privada\r\n', 'Sin Dato', 0, 'Sin Dato', 'En el sector en donde se encuentra ubicada la cascada no se realiza ningún evento, hay que destacar que para acceder a la cascada no hay sendero definido.\r\n', 'Conservado', 'Está dentro del bosque primario y su remanente es representativo.\r\n', 'Alterado', 'Existe sendero hasta 1km. Antes de llegar a la cascada, pero es usado para trasladar el ganado de un potrero a otro, causando que el sendero sea dañado y dificultando su acceso.\r\n'),
(37, 'Cueva del oso', '-3.678361', '-78.704861', 1463, '23', '2309.4 cm3\r\n', 'Esta cueva es una de las más grande del sector, tiene un recorrido dentro de ella de aproximadamente de 2 horas, se ubica en la parroquia Chicaña sector el Oso, dentro de la cueva se puede observar formaciones naturales hechas por gotas de agua a través del tiempo, se observa murciélagos.\r\n', 'El atractivo se encuentra conservado.\r\n', 'No existen estudios de la cueva\r\n', 'El atractivo es conocido por la población y gobierno local.\r\n', 'Se encuentra en propiedad privada\r\n', 'Sin Dato', 0, 'Sin Dato', 'No existen acontecimientos en el atractivo\r\n', 'Conservado', 'Es poco visitado\r\n', 'Alterado', 'Está ubicado dentro de terrenos privados que han sido destinados para pastizales.\r\n'),
(38, 'Laguna del oso', '-3.680528', '-78.703806', 1452, '23', '2309.4 cm3', 'Es una formación producto de la cascada del oso, no tiene fondo, está ubicada dentro de bosque primario, este escenario de biodiversidad de la zona, llama la atención a propios y a extraños, para realizar actividades de natación.\r\n', 'Dispone de gran cantidad de agua,Está ubicada dentro del bosque primario\r\n', 'No hay sendero definido\r\n', 'Pocas personas la conocen, lo que favorece su conservación.\r\n', 'Se encuentra en propiedad privada\r\n', 'Sin Dato', 0, 'Sin Dato', 'En la sector en donde se encuentra ubicada la cascada no se realiza ningún evento, hay que destacar que para acceder a la laguna no hay sendero definido.\r\n', 'Conservado', 'Está dentro del bosque primario y su remanente es representativo.\r\n', 'Alterado', 'Existe sendero hasta 1km. Antes de llegar a la cascada, pero es usado para trasladar el ganado de un potrero a otro, causando que el sendero sea dañado y dificultando su acceso.\r\n'),
(39, 'Cascada el Descanso\r\n', '-3.714222', '-78.727083', 1030, '23', '2309.4 cm3\r\n', 'La Cascada El Descanso, se encuentra a 20 minutos de la Cascada La Maravilla a una distancia de 150 metros, el nombre fue dado por la forma de las dos caídas donde se ve que las aguas descansan y continúa su caída, tiene una altura aproximadamente de 15m. Existe un sendero, al mismo que se le debe dar mantenimiento.\r\n', 'Abundante flujo de agua\r\n', 'Mejoramiento de los senderos.\r\n', 'Facil accesibilidad.\r\n', 'No tener estudios de Mercado.\r\n', 'Sin Dato', 0, 'Sin Dato', 'No se realizan acontecimientos programados en el atractivo.\r\n', 'Conservado', 'Ser encuentra dentro de bosque nativo\r\n', 'Conservado', 'Existe bosque primario.\r\n'),
(40, 'Cascada la Maravilla', '-3.714444', '-78.727667', 1032, '23', '2309.4 cm3', 'Para llegar a esta cascada se camina 30 minutos a una distancia aproximada de 300 metros desde la cascada Trillizas, aguas arriba en esta quebrada. La cascada Maravilla tiene una altura de 30m, consta de una sola caída, tiene una belleza esplendida. Existe sendero señalizado, sin embargo el mismo necesita de mantenimiento.', 'Abundante flujo de agua', 'Falta de mantenimiento a los senderos', 'Facil acceso', 'Disminucion del caudal del agua en epocas de verano', 'Sin Dato', 0, 'Sin Dato', 'No se realiza ningún acontecimiento programado.', 'Conservado', 'Se encuentra dentro de bosque primario', 'Conservado', 'Se encuentra la presencia de bosque primario.'),
(41, 'Comunidad chapimza                                                          ', '0', '0', 0, '0', '0', 'Sin Datos', 'Sin Datos', 'Sin Datos', 'Sin Datos', 'Sin Datos', 'Sin Datos', 0, 'Sin Datos', 'Sin Datos', 'Sin Datos', 'Sin Datos', 'Sin Datos', 'Sin Datos'),
(42, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'sadasd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'efren', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Atractivo_Ubicacion`
--

CREATE TABLE IF NOT EXISTS `Atractivo_Ubicacion` (
  `ID_Parroquia` int(11) NOT NULL,
  `ID_canton` int(11) NOT NULL,
  `ID_Provincia` int(11) NOT NULL,
  `ID_Atractivo_Turistico` int(11) NOT NULL,
  PRIMARY KEY (`ID_Parroquia`,`ID_canton`,`ID_Provincia`,`ID_Atractivo_Turistico`),
  KEY `FK_Reference_36` (`ID_canton`),
  KEY `FK_Reference_37` (`ID_Provincia`),
  KEY `FK_Reference_38` (`ID_Atractivo_Turistico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Atractivo_Ubicacion`
--

INSERT INTO `Atractivo_Ubicacion` (`ID_Parroquia`, `ID_canton`, `ID_Provincia`, `ID_Atractivo_Turistico`) VALUES
(1, 1, 1, 1),
(1, 1, 1, 2),
(1, 1, 1, 30),
(5, 1, 1, 8),
(2, 2, 1, 3),
(2, 2, 1, 7),
(2, 2, 1, 12),
(2, 2, 1, 13),
(2, 2, 1, 15),
(4, 2, 1, 14),
(3, 3, 1, 4),
(3, 3, 1, 5),
(3, 3, 1, 6),
(3, 3, 1, 9),
(3, 3, 1, 10),
(3, 3, 1, 16),
(3, 3, 1, 17),
(3, 3, 1, 23),
(3, 3, 1, 36),
(3, 3, 1, 37),
(3, 3, 1, 38),
(3, 3, 1, 39),
(3, 3, 1, 40),
(6, 3, 1, 18),
(6, 3, 1, 19),
(6, 3, 1, 20),
(6, 3, 1, 26),
(6, 3, 1, 27),
(6, 3, 1, 28),
(4, 4, 1, 22),
(7, 4, 1, 21);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Canton`
--

CREATE TABLE IF NOT EXISTS `Canton` (
  `ID_canton` int(11) NOT NULL,
  `Pro_ID_Provincia` int(11) DEFAULT NULL,
  `Canton_Nombre` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ID_canton`),
  KEY `FK_Reference_7` (`Pro_ID_Provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Se relaciona con una provincia\r\ndepende de una para exi';

--
-- Volcado de datos para la tabla `Canton`
--

INSERT INTO `Canton` (`ID_canton`, `Pro_ID_Provincia`, `Canton_Nombre`) VALUES
(1, 1, 'Yacuambi       '),
(2, 1, 'Zamora'),
(3, 1, 'Yantzaza'),
(4, 1, 'Centinela del Cóndor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Categoria_Persona`
--

CREATE TABLE IF NOT EXISTS `Categoria_Persona` (
  `ID_CategoriaP` int(10) NOT NULL,
  `Nombre_Categoria` varchar(100) DEFAULT NULL,
  `Descripcion_Categoria` text,
  PRIMARY KEY (`ID_CategoriaP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='categorias de las personas';

--
-- Volcado de datos para la tabla `Categoria_Persona`
--

INSERT INTO `Categoria_Persona` (`ID_CategoriaP`, `Nombre_Categoria`, `Descripcion_Categoria`) VALUES
(1, 'Encuestador', 'Sin Datos'),
(2, 'Supervisor Evaluador', 'Sin Datos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Centros_Urbanos_Cercanos`
--

CREATE TABLE IF NOT EXISTS `Centros_Urbanos_Cercanos` (
  `ID_Poblado` int(11) NOT NULL,
  `ID_Atractivo_Turistico` int(11) NOT NULL,
  `Distancia` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Poblado`,`ID_Atractivo_Turistico`),
  KEY `FK_Reference_12` (`ID_Atractivo_Turistico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Centros Urbanos Cercanos al Atractivo Turistico';

--
-- Volcado de datos para la tabla `Centros_Urbanos_Cercanos`
--

INSERT INTO `Centros_Urbanos_Cercanos` (`ID_Poblado`, `ID_Atractivo_Turistico`, `Distancia`) VALUES
(1, 1, 8),
(1, 2, NULL),
(2, 3, 14),
(3, 3, 36),
(4, 4, 15),
(4, 5, 16),
(4, 6, 15),
(4, 9, 16),
(4, 10, 16),
(4, 14, 2),
(4, 15, 500),
(4, 23, 17),
(7, 7, 6),
(8, 4, 5),
(8, 5, 6),
(8, 6, 5),
(8, 9, 6),
(8, 10, 6),
(8, 16, 6),
(8, 17, 5),
(8, 20, 8),
(8, 37, 6),
(8, 38, 6),
(8, 39, 6),
(9, 18, 0),
(9, 27, NULL),
(10, 19, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Difusion`
--

CREATE TABLE IF NOT EXISTS `Difusion` (
  `ID_difucion` int(11) NOT NULL,
  `Difucion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_difucion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Difusion`
--

INSERT INTO `Difusion` (`ID_difucion`, `Difucion`) VALUES
(1, 'LOCAL'),
(2, 'PROVINCIAL'),
(3, 'NACIONAL'),
(4, 'INTERNACIONAL'),
(5, 'Sin Datos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Estructura_Vail_Acceso`
--

CREATE TABLE IF NOT EXISTS `Estructura_Vail_Acceso` (
  `ID_Tipo_Acceso` int(11) NOT NULL,
  `ID_Subtipo` int(11) NOT NULL,
  `ID_Medio_Acesso` int(11) NOT NULL,
  `ID_Frecuencia` int(11) NOT NULL,
  `ID_Atractivo_Turistico` int(11) NOT NULL,
  PRIMARY KEY (`ID_Tipo_Acceso`,`ID_Subtipo`,`ID_Medio_Acesso`,`ID_Frecuencia`,`ID_Atractivo_Turistico`),
  KEY `FK_Reference_17` (`ID_Subtipo`),
  KEY `FK_Reference_18` (`ID_Medio_Acesso`),
  KEY `FK_Reference_19` (`ID_Frecuencia`),
  KEY `FK_Reference_20` (`ID_Atractivo_Turistico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Estructura_Vail_Acceso`
--

INSERT INTO `Estructura_Vail_Acceso` (`ID_Tipo_Acceso`, `ID_Subtipo`, `ID_Medio_Acesso`, `ID_Frecuencia`, `ID_Atractivo_Turistico`) VALUES
(1, 1, 1, 1, 18),
(1, 1, 1, 1, 26),
(1, 1, 1, 1, 27),
(1, 1, 1, 5, 29),
(1, 1, 2, 5, 30),
(1, 2, 1, 1, 3),
(1, 2, 1, 1, 7),
(1, 2, 1, 1, 11),
(1, 2, 1, 1, 14),
(1, 2, 1, 1, 15),
(1, 2, 1, 1, 16),
(1, 2, 1, 1, 19),
(1, 2, 1, 1, 20),
(1, 2, 1, 1, 36),
(1, 2, 1, 1, 37),
(1, 2, 1, 1, 38),
(1, 2, 1, 1, 39),
(1, 2, 1, 1, 40),
(1, 2, 1, 5, 2),
(1, 2, 2, 1, 3),
(1, 2, 2, 1, 7),
(1, 2, 2, 1, 11),
(1, 2, 2, 1, 13),
(1, 2, 2, 1, 14),
(1, 2, 2, 1, 15),
(1, 2, 2, 1, 17),
(1, 2, 2, 5, 2),
(1, 2, 2, 5, 29),
(1, 2, 2, 5, 30),
(1, 2, 2, 5, 32),
(1, 2, 3, 1, 3),
(1, 2, 3, 1, 7),
(1, 2, 3, 1, 11),
(1, 2, 3, 1, 14),
(1, 2, 3, 1, 15),
(1, 2, 3, 1, 17),
(1, 2, 3, 5, 8),
(1, 2, 3, 5, 32),
(1, 2, 4, 1, 28),
(1, 2, 4, 5, 2),
(1, 3, 2, 1, 4),
(1, 3, 2, 1, 5),
(1, 3, 2, 1, 6),
(1, 3, 2, 1, 9),
(1, 3, 2, 1, 10),
(1, 3, 2, 1, 23),
(1, 3, 3, 1, 4),
(1, 3, 3, 1, 5),
(1, 3, 3, 1, 6),
(1, 3, 3, 1, 9),
(1, 3, 3, 1, 10),
(1, 3, 3, 1, 12),
(1, 3, 3, 1, 23),
(1, 3, 3, 5, 29),
(1, 3, 3, 5, 30),
(1, 3, 11, 5, 21),
(1, 4, 2, 1, 28),
(1, 4, 3, 1, 12),
(1, 4, 3, 1, 13),
(1, 4, 4, 1, 28),
(1, 4, 7, 1, 4),
(1, 4, 7, 1, 36),
(1, 4, 7, 1, 37),
(1, 4, 7, 1, 38),
(1, 4, 7, 5, 2),
(1, 4, 7, 5, 8),
(1, 4, 7, 5, 32),
(1, 4, 11, 5, 21),
(1, 4, 11, 5, 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Facilidades_Turisticas`
--

CREATE TABLE IF NOT EXISTS `Facilidades_Turisticas` (
  `ID_Servicio` int(11) NOT NULL,
  `ID_Ser_Categoria` int(11) NOT NULL,
  `ID_Atractivo_Turistico` int(11) NOT NULL,
  `Numero_Establecimientos` int(11) DEFAULT NULL,
  `Plazas` int(11) DEFAULT NULL,
  `Agencia_Viaje` varchar(10) DEFAULT NULL,
  `Almacenes_Artesanias` varchar(10) DEFAULT NULL,
  `Otros` varchar(10) DEFAULT NULL,
  `Correos` varchar(10) DEFAULT NULL,
  `Telefonia` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID_Servicio`,`ID_Ser_Categoria`,`ID_Atractivo_Turistico`),
  KEY `FK_Reference_22` (`ID_Ser_Categoria`),
  KEY `FK_Reference_23` (`ID_Atractivo_Turistico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Facilidades_Turisticas`
--

INSERT INTO `Facilidades_Turisticas` (`ID_Servicio`, `ID_Ser_Categoria`, `ID_Atractivo_Turistico`, `Numero_Establecimientos`, `Plazas`, `Agencia_Viaje`, `Almacenes_Artesanias`, `Otros`, `Correos`, `Telefonia`) VALUES
(2, 4, 3, 1, 20, 'NO', 'NO', 'NO', 'NO', 'NO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ficha`
--

CREATE TABLE IF NOT EXISTS `Ficha` (
  `ID_Ficha` tinyint(10) NOT NULL COMMENT 'numero a sigando  a cada uno de los integrantes',
  `Ficha_Numero` int(10) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `ID_Atractivo_Turistico` int(10) NOT NULL,
  PRIMARY KEY (`ID_Ficha`),
  KEY `FK_Reference_4` (`ID_Atractivo_Turistico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Incluye la información de los datos generales de la ficha';

--
-- Volcado de datos para la tabla `Ficha`
--

INSERT INTO `Ficha` (`ID_Ficha`, `Ficha_Numero`, `Fecha`, `ID_Atractivo_Turistico`) VALUES
(1, 5, '2013-07-03', 1),
(2, 6, '2013-07-03', 2),
(6, 5, '2013-07-04', 4),
(7, 1, '2013-07-04', 5),
(8, 5, '2013-07-04', 6),
(9, 4, '2013-07-04', 9),
(10, 2, '2013-07-04', 10),
(11, 0, '2013-07-05', 11),
(12, 0, '2013-07-05', 15),
(13, 0, NULL, 21),
(14, 0, '2013-07-21', 22),
(15, 0, '2013-07-04', 23),
(16, 0, NULL, 28),
(17, 9, '2013-07-03', 29),
(18, 10, '2013-07-03', 30),
(20, 0, NULL, 26),
(24, NULL, NULL, 16),
(25, NULL, NULL, 17),
(26, 0, NULL, 27),
(27, NULL, NULL, 18),
(28, NULL, NULL, 19),
(29, NULL, NULL, 20),
(31, 1, '2013-06-20', 3),
(32, NULL, NULL, 7),
(33, 2, '2013-06-20', 12),
(34, 4, '2013-06-21', 13),
(35, 12, '2013-07-05', 14),
(37, 0, NULL, 37),
(38, 0, NULL, 38),
(39, 0, NULL, 39),
(40, 0, NULL, 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Frecuencia_Acceso`
--

CREATE TABLE IF NOT EXISTS `Frecuencia_Acceso` (
  `ID_Frecuencia` int(11) NOT NULL,
  `Frecuencia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Frecuencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Frecuencia_Acceso`
--

INSERT INTO `Frecuencia_Acceso` (`ID_Frecuencia`, `Frecuencia`) VALUES
(1, 'Diaria'),
(2, 'Semanal'),
(3, 'Mensual'),
(4, 'Eventual'),
(5, 'Sin Datos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Infraestructura_Basica`
--

CREATE TABLE IF NOT EXISTS `Infraestructura_Basica` (
  `ID_Atractivo_Turistico` int(11) NOT NULL,
  `Agua_Potable` varchar(10) DEFAULT NULL,
  `Agua_Entubada` varchar(10) DEFAULT NULL,
  `Agua_Tratada` varchar(10) DEFAULT NULL,
  `Agua_Pozo` varchar(10) DEFAULT NULL,
  `Agua_No_Existe` varchar(10) DEFAULT NULL,
  `Sistema_Interconectado` varchar(10) DEFAULT NULL,
  `Generador` varchar(10) DEFAULT NULL,
  `Ene_Elec_NoExiste` varchar(10) DEFAULT NULL,
  `Ene_Elec_Otros` varchar(10) DEFAULT NULL,
  `Alca_Red_Publico` varchar(10) DEFAULT NULL,
  `Pozo_Ciego` varchar(10) DEFAULT NULL,
  `Pozo_Septico` varchar(10) DEFAULT NULL,
  `Alca_NoExiste` varchar(10) DEFAULT NULL,
  `Alca_Otos` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID_Atractivo_Turistico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Infraestructura_Basica`
--

INSERT INTO `Infraestructura_Basica` (`ID_Atractivo_Turistico`, `Agua_Potable`, `Agua_Entubada`, `Agua_Tratada`, `Agua_Pozo`, `Agua_No_Existe`, `Sistema_Interconectado`, `Generador`, `Ene_Elec_NoExiste`, `Ene_Elec_Otros`, `Alca_Red_Publico`, `Pozo_Ciego`, `Pozo_Septico`, `Alca_NoExiste`, `Alca_Otos`) VALUES
(1, 'SI', 'NO', 'NO', 'NO', 'NO', 'Si', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'NO'),
(2, 'SI', 'NO', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'NO'),
(3, 'SI', 'NO', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'NO'),
(4, 'SI', 'NO', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'NO'),
(5, 'Si', 'NO', 'NO', 'NO', 'NO', 'Si', 'NO', 'NO', 'NO', 'Si', 'NO', 'NO', 'NO', 'NO'),
(6, 'Si', 'NO', 'NO', 'NO', 'NO', 'Si', 'NO', 'NO', 'NO', 'Si', 'NO', 'NO', 'NO', 'NO'),
(7, 'SI', 'NO', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'NO'),
(9, 'Si', 'NO', 'NO', 'NO', 'NO', 'Si', 'NO', 'NO', 'NO', 'Si', 'NO', 'NO', 'NO', 'NO'),
(10, 'Si', 'NO', 'NO', 'NO', 'NO', 'Si', 'NO', 'NO', 'NO', 'Si', 'NO', 'NO', 'NO', 'NO'),
(11, 'SI', 'NO', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'NO'),
(12, 'SI', 'NO', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'SI', 'NO'),
(13, 'SI', 'NO', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'NO'),
(14, 'SI', 'NO', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'NO'),
(16, 'SI', 'NO', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'NO'),
(17, 'SI', 'NO', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'NO'),
(18, 'SI', 'NO', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'NO'),
(19, 'SI', 'NO', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'NO'),
(20, 'SI', 'NO', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'NO'),
(21, 'SI', 'NO', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'NO'),
(22, 'SI', 'NO', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'NO'),
(23, 'SI', 'NO', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'NO'),
(26, 'Si', 'No', 'No', 'No', 'No', 'Si', 'No', 'No', 'No', 'Si', 'No', 'No', 'No', 'No'),
(37, 'SI', 'NO', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'NO'),
(38, 'SI', 'NO', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'NO'),
(39, 'SI', 'NO', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'SI', 'NO', 'NO', 'NO', 'NO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Medio_Acceso`
--

CREATE TABLE IF NOT EXISTS `Medio_Acceso` (
  `ID_Medio_Acesso` int(11) NOT NULL,
  `Medio_Acceso` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Medio_Acesso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Medio_Acceso`
--

INSERT INTO `Medio_Acceso` (`ID_Medio_Acesso`, `Medio_Acceso`) VALUES
(1, 'Bus'),
(2, 'Automovil'),
(3, '4x4'),
(4, 'Tren'),
(5, 'Barco'),
(6, 'Canoa'),
(7, 'Otros'),
(8, 'Avion'),
(9, 'Avioneta'),
(10, 'Helicoptero'),
(11, 'Sin Datos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Parroquia`
--

CREATE TABLE IF NOT EXISTS `Parroquia` (
  `ID_canton` int(11) NOT NULL,
  `ID_Parroquia` int(11) NOT NULL,
  `Parroquia_Nombre` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID_Parroquia`),
  KEY `FK_Reference_8` (`ID_canton`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Datos de las parroquias de un canton que existen en una prov';

--
-- Volcado de datos para la tabla `Parroquia`
--

INSERT INTO `Parroquia` (`ID_canton`, `ID_Parroquia`, `Parroquia_Nombre`) VALUES
(1, 1, 'La Paz   '),
(2, 2, 'San Carlos'),
(3, 3, 'Chicaña'),
(2, 4, 'Guadalupe'),
(1, 5, 'Tutupali'),
(3, 6, 'Los Encuentros'),
(4, 7, 'Panguintza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Patrimonios`
--

CREATE TABLE IF NOT EXISTS `Patrimonios` (
  `ID_Patrimonio` int(11) NOT NULL,
  `Nombre_Patrimonio` text,
  `Detalle_Patrimonio` text,
  PRIMARY KEY (`ID_Patrimonio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Patrimonios`
--

INSERT INTO `Patrimonios` (`ID_Patrimonio`, `Nombre_Patrimonio`, `Detalle_Patrimonio`) VALUES
(1, 'Patrimonio de la Humanidad', 'SIN DATO'),
(2, 'Patrimonio del Ecuador', 'SIN DATO'),
(3, 'Sin Datos', 'Sin Datos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Patrimonio_Atractivo`
--

CREATE TABLE IF NOT EXISTS `Patrimonio_Atractivo` (
  `ID_Patrimonio` int(11) NOT NULL,
  `ID_Atractivo_Turistico` int(11) NOT NULL,
  `Fecha_` date DEFAULT NULL,
  PRIMARY KEY (`ID_Patrimonio`,`ID_Atractivo_Turistico`),
  KEY `FK_Reference_15` (`ID_Atractivo_Turistico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tipo de patrimonio q es un Artractivo';

--
-- Volcado de datos para la tabla `Patrimonio_Atractivo`
--

INSERT INTO `Patrimonio_Atractivo` (`ID_Patrimonio`, `ID_Atractivo_Turistico`, `Fecha_`) VALUES
(1, 26, NULL),
(3, 4, NULL),
(3, 5, NULL),
(3, 6, NULL),
(3, 9, NULL),
(3, 10, NULL),
(3, 11, NULL),
(3, 15, NULL),
(3, 16, NULL),
(3, 17, NULL),
(3, 18, NULL),
(3, 19, NULL),
(3, 20, NULL),
(3, 21, NULL),
(3, 22, NULL),
(3, 23, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Persona`
--

CREATE TABLE IF NOT EXISTS `Persona` (
  `ID_Persona` int(3) NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(50) DEFAULT NULL,
  `Apellidos` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Persona`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Incorpora datos generales de las entidad persona para luego ' AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `Persona`
--

INSERT INTO `Persona` (`ID_Persona`, `Nombres`, `Apellidos`) VALUES
(1, 'cadademias', 'Macas Romero'),
(2, 'María Gabriela ', 'Suasnavas'),
(3, 'Juliana ', 'Torres'),
(4, 'María Gabriela', 'Suasnavas'),
(5, 'Sin datos', 'Sin datos'),
(6, 'Patricia', 'Armijos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Persona_Categoria_Ficha`
--

CREATE TABLE IF NOT EXISTS `Persona_Categoria_Ficha` (
  `ID_Persona` int(3) NOT NULL,
  `ID_Ficha` tinyint(10) NOT NULL COMMENT 'numero a sigando  a cada uno de los integrantes',
  `ID_CategoriaP` int(10) NOT NULL,
  PRIMARY KEY (`ID_Persona`,`ID_Ficha`,`ID_CategoriaP`),
  KEY `FK_Reference_261` (`ID_Persona`),
  KEY `FK_Reference_271` (`ID_Ficha`),
  KEY `FK_Reference_39` (`ID_CategoriaP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Integra información de las categorías que tienen las persona';

--
-- Volcado de datos para la tabla `Persona_Categoria_Ficha`
--

INSERT INTO `Persona_Categoria_Ficha` (`ID_Persona`, `ID_Ficha`, `ID_CategoriaP`) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 6, 1),
(2, 7, 1),
(2, 8, 1),
(2, 9, 1),
(2, 10, 1),
(1, 11, 1),
(1, 12, 1),
(3, 13, 1),
(4, 14, 1),
(4, 15, 1),
(1, 18, 1),
(1, 32, 1),
(1, 33, 1),
(1, 34, 1),
(1, 35, 1),
(6, 37, 1),
(1, 40, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Poblado`
--

CREATE TABLE IF NOT EXISTS `Poblado` (
  `ID_Poblado` int(11) NOT NULL,
  `ID_Parroquia` int(11) DEFAULT NULL,
  `Poblado_Nombre` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID_Poblado`),
  KEY `FK_Reference_9` (`ID_Parroquia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='datos de los poblados que se encuentran en una parroqui';

--
-- Volcado de datos para la tabla `Poblado`
--

INSERT INTO `Poblado` (`ID_Poblado`, `ID_Parroquia`, `Poblado_Nombre`) VALUES
(0, NULL, NULL),
(1, 1, 'La Paz  '),
(2, 2, 'Cumbaratza'),
(3, 2, 'Zamora'),
(4, 3, 'Yantzaza'),
(5, 4, 'Guadalupe'),
(6, 5, 'Tutupali   '),
(7, 2, 'Namirez'),
(8, 3, 'Chicaña'),
(9, 6, 'Petroglifo de Padmi'),
(10, 6, 'Los Encuentros'),
(11, 7, 'Panguintza'),
(12, 6, 'Zumbi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Provincia`
--

CREATE TABLE IF NOT EXISTS `Provincia` (
  `ID_Provincia` int(11) NOT NULL,
  `Provincia_Nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Datos de las provincia';

--
-- Volcado de datos para la tabla `Provincia`
--

INSERT INTO `Provincia` (`ID_Provincia`, `Provincia_Nombre`) VALUES
(1, 'Zamora Chinchipe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Servicios`
--

CREATE TABLE IF NOT EXISTS `Servicios` (
  `ID_Servicio` int(11) NOT NULL,
  `Servicio` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`ID_Servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Servicios`
--

INSERT INTO `Servicios` (`ID_Servicio`, `Servicio`) VALUES
(1, 'Alojamiento'),
(2, 'Alimentación'),
(3, 'Esparcimiento'),
(4, 'CORREOS'),
(5, 'AGENCIA DE VIAJE'),
(6, 'ALMACENES DE ARTESANIAS'),
(7, 'TELEFONOS, FAX, TELEX'),
(8, 'OTROS'),
(9, 'Sin Datos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Servicio_Categoria`
--

CREATE TABLE IF NOT EXISTS `Servicio_Categoria` (
  `ID_Ser_Categoria` int(11) NOT NULL,
  `Ser_Categoria` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Ser_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Servicio_Categoria`
--

INSERT INTO `Servicio_Categoria` (`ID_Ser_Categoria`, `Ser_Categoria`) VALUES
(1, 'Lujo'),
(2, 'Primera'),
(3, 'Segunda'),
(4, 'Tercera'),
(5, 'Sin Datos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SubTipo_Acceso`
--

CREATE TABLE IF NOT EXISTS `SubTipo_Acceso` (
  `ID_Subtipo` int(11) NOT NULL,
  `Subtipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Subtipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SubTipo_Acceso`
--

INSERT INTO `SubTipo_Acceso` (`ID_Subtipo`, `Subtipo`) VALUES
(1, 'Asfaltado'),
(2, 'Lastrado'),
(3, 'Empedrado'),
(4, 'Sendero'),
(5, 'Maritimo'),
(6, 'Fluvial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tipo_Acceso`
--

CREATE TABLE IF NOT EXISTS `Tipo_Acceso` (
  `ID_Tipo_Acceso` int(11) NOT NULL,
  `Acceso_Tipo` varchar(50) DEFAULT NULL,
  `Temporalidad_Acceso` text,
  `Observaciones` text,
  PRIMARY KEY (`ID_Tipo_Acceso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Tipo_Acceso`
--

INSERT INTO `Tipo_Acceso` (`ID_Tipo_Acceso`, `Acceso_Tipo`, `Temporalidad_Acceso`, `Observaciones`) VALUES
(1, 'TERRESTRE', 'DIAS AL AÑO', 'NINGUNA'),
(2, 'ACUATICO', 'DIAS AL MES', 'NINGUNA'),
(3, 'AEREO', 'HORAS AL DIA', 'NINGUNA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tipo_Difucion`
--

CREATE TABLE IF NOT EXISTS `Tipo_Difucion` (
  `ID_Atractivo_Turistico` int(11) NOT NULL,
  `ID_difucion` int(11) NOT NULL,
  PRIMARY KEY (`ID_Atractivo_Turistico`,`ID_difucion`),
  KEY `FK_Reference_29` (`ID_difucion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Tipo_Difucion`
--

INSERT INTO `Tipo_Difucion` (`ID_Atractivo_Turistico`, `ID_difucion`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(9, 1),
(10, 1),
(12, 1),
(15, 1),
(19, 1),
(23, 1),
(27, 1),
(28, 1),
(30, 1),
(37, 1),
(38, 1),
(39, 1),
(14, 2),
(16, 2),
(17, 2),
(18, 2),
(20, 2),
(26, 2),
(11, 5),
(21, 5),
(22, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `ID_usuario` varchar(100) NOT NULL,
  `clave` varchar(18) NOT NULL,
  `rol` int(1) NOT NULL,
  PRIMARY KEY (`ID_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_usuario`, `clave`, `rol`) VALUES
('efren', 'loxa', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Atractivos_Secanos`
--
ALTER TABLE `Atractivos_Secanos`
  ADD CONSTRAINT `FK_Reference_25` FOREIGN KEY (`ID_Atractivo`) REFERENCES `Atractivo_Turistico` (`ID_Atractivo_Turistico`),
  ADD CONSTRAINT `FK_Reference_26` FOREIGN KEY (`ID_Atractivo_Sercano`) REFERENCES `Atractivo_Turistico` (`ID_Atractivo_Turistico`);

--
-- Filtros para la tabla `Atractivo_Detalle`
--
ALTER TABLE `Atractivo_Detalle`
  ADD CONSTRAINT `FK_Reference_291` FOREIGN KEY (`ID_Atractivo_Categoria`) REFERENCES `Atractivo_Categoria` (`ID_Atractivo_Categoria`),
  ADD CONSTRAINT `FK_Reference_301` FOREIGN KEY (`ID_Atractivo_Subtipo`) REFERENCES `Atractivo_Subtipo` (`ID_Atractivo_Subtipo`),
  ADD CONSTRAINT `FK_Reference_31` FOREIGN KEY (`ID_Atrat_tipo`) REFERENCES `Atractivo_Tipo` (`ID_Atrat_tipo`),
  ADD CONSTRAINT `FK_Reference_32` FOREIGN KEY (`ID_Atractivo_Turistico`) REFERENCES `Atractivo_Turistico` (`ID_Atractivo_Turistico`);

--
-- Filtros para la tabla `Atractivo_Subtipo`
--
ALTER TABLE `Atractivo_Subtipo`
  ADD CONSTRAINT `FK_Reference_34` FOREIGN KEY (`ID_Atrat_tipo`) REFERENCES `Atractivo_Tipo` (`ID_Atrat_tipo`);

--
-- Filtros para la tabla `Atractivo_Tipo`
--
ALTER TABLE `Atractivo_Tipo`
  ADD CONSTRAINT `FK_Reference_33` FOREIGN KEY (`ID_Atractivo_Categoria`) REFERENCES `Atractivo_Categoria` (`ID_Atractivo_Categoria`);

--
-- Filtros para la tabla `Atractivo_Ubicacion`
--
ALTER TABLE `Atractivo_Ubicacion`
  ADD CONSTRAINT `FK_Reference_35` FOREIGN KEY (`ID_Parroquia`) REFERENCES `Parroquia` (`ID_Parroquia`),
  ADD CONSTRAINT `FK_Reference_36` FOREIGN KEY (`ID_canton`) REFERENCES `Canton` (`ID_canton`),
  ADD CONSTRAINT `FK_Reference_37` FOREIGN KEY (`ID_Provincia`) REFERENCES `Provincia` (`ID_Provincia`),
  ADD CONSTRAINT `FK_Reference_38` FOREIGN KEY (`ID_Atractivo_Turistico`) REFERENCES `Atractivo_Turistico` (`ID_Atractivo_Turistico`);

--
-- Filtros para la tabla `Canton`
--
ALTER TABLE `Canton`
  ADD CONSTRAINT `FK_Reference_7` FOREIGN KEY (`Pro_ID_Provincia`) REFERENCES `Provincia` (`ID_Provincia`);

--
-- Filtros para la tabla `Centros_Urbanos_Cercanos`
--
ALTER TABLE `Centros_Urbanos_Cercanos`
  ADD CONSTRAINT `FK_Reference_11` FOREIGN KEY (`ID_Poblado`) REFERENCES `Poblado` (`ID_Poblado`),
  ADD CONSTRAINT `FK_Reference_12` FOREIGN KEY (`ID_Atractivo_Turistico`) REFERENCES `Atractivo_Turistico` (`ID_Atractivo_Turistico`);

--
-- Filtros para la tabla `Estructura_Vail_Acceso`
--
ALTER TABLE `Estructura_Vail_Acceso`
  ADD CONSTRAINT `FK_Reference_16` FOREIGN KEY (`ID_Tipo_Acceso`) REFERENCES `Tipo_Acceso` (`ID_Tipo_Acceso`),
  ADD CONSTRAINT `FK_Reference_17` FOREIGN KEY (`ID_Subtipo`) REFERENCES `SubTipo_Acceso` (`ID_Subtipo`),
  ADD CONSTRAINT `FK_Reference_18` FOREIGN KEY (`ID_Medio_Acesso`) REFERENCES `Medio_Acceso` (`ID_Medio_Acesso`),
  ADD CONSTRAINT `FK_Reference_19` FOREIGN KEY (`ID_Frecuencia`) REFERENCES `Frecuencia_Acceso` (`ID_Frecuencia`),
  ADD CONSTRAINT `FK_Reference_20` FOREIGN KEY (`ID_Atractivo_Turistico`) REFERENCES `Atractivo_Turistico` (`ID_Atractivo_Turistico`);

--
-- Filtros para la tabla `Facilidades_Turisticas`
--
ALTER TABLE `Facilidades_Turisticas`
  ADD CONSTRAINT `FK_Reference_21` FOREIGN KEY (`ID_Servicio`) REFERENCES `Servicios` (`ID_Servicio`),
  ADD CONSTRAINT `FK_Reference_22` FOREIGN KEY (`ID_Ser_Categoria`) REFERENCES `Servicio_Categoria` (`ID_Ser_Categoria`),
  ADD CONSTRAINT `FK_Reference_23` FOREIGN KEY (`ID_Atractivo_Turistico`) REFERENCES `Atractivo_Turistico` (`ID_Atractivo_Turistico`);

--
-- Filtros para la tabla `Ficha`
--
ALTER TABLE `Ficha`
  ADD CONSTRAINT `FK_Reference_4` FOREIGN KEY (`ID_Atractivo_Turistico`) REFERENCES `Atractivo_Turistico` (`ID_Atractivo_Turistico`);

--
-- Filtros para la tabla `Infraestructura_Basica`
--
ALTER TABLE `Infraestructura_Basica`
  ADD CONSTRAINT `FK_Reference_24` FOREIGN KEY (`ID_Atractivo_Turistico`) REFERENCES `Atractivo_Turistico` (`ID_Atractivo_Turistico`);

--
-- Filtros para la tabla `Parroquia`
--
ALTER TABLE `Parroquia`
  ADD CONSTRAINT `FK_Reference_8` FOREIGN KEY (`ID_canton`) REFERENCES `Canton` (`ID_canton`);

--
-- Filtros para la tabla `Patrimonio_Atractivo`
--
ALTER TABLE `Patrimonio_Atractivo`
  ADD CONSTRAINT `FK_Reference_14` FOREIGN KEY (`ID_Patrimonio`) REFERENCES `Patrimonios` (`ID_Patrimonio`),
  ADD CONSTRAINT `FK_Reference_15` FOREIGN KEY (`ID_Atractivo_Turistico`) REFERENCES `Atractivo_Turistico` (`ID_Atractivo_Turistico`);

--
-- Filtros para la tabla `Persona_Categoria_Ficha`
--
ALTER TABLE `Persona_Categoria_Ficha`
  ADD CONSTRAINT `FK_Reference_261` FOREIGN KEY (`ID_Persona`) REFERENCES `Persona` (`ID_Persona`),
  ADD CONSTRAINT `FK_Reference_271` FOREIGN KEY (`ID_Ficha`) REFERENCES `Ficha` (`ID_Ficha`),
  ADD CONSTRAINT `FK_Reference_39` FOREIGN KEY (`ID_CategoriaP`) REFERENCES `Categoria_Persona` (`ID_CategoriaP`);

--
-- Filtros para la tabla `Poblado`
--
ALTER TABLE `Poblado`
  ADD CONSTRAINT `FK_Reference_9` FOREIGN KEY (`ID_Parroquia`) REFERENCES `Parroquia` (`ID_Parroquia`);

--
-- Filtros para la tabla `Tipo_Difucion`
--
ALTER TABLE `Tipo_Difucion`
  ADD CONSTRAINT `FK_Reference_27` FOREIGN KEY (`ID_Atractivo_Turistico`) REFERENCES `Atractivo_Turistico` (`ID_Atractivo_Turistico`),
  ADD CONSTRAINT `FK_Reference_29` FOREIGN KEY (`ID_difucion`) REFERENCES `Difusion` (`ID_difucion`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
