	
	  
		TexoMatlab Public library V2.0

		 for the UltraSonix RP 500

		 
 		jean-martial.mari@inserm.fr

		(c) Imperial College London 2009, INSERM, France 2010

		Developed by Jean Martial Mari, PhD



	This library offers macros for the operation of the Ultrasonix RP 500 from a program. 
	Information can be found in the Documentation file provided. This documentation is to 
	be used alongside that provided with the UltraSonix scanner, and assumes familiarity 
	with that material. Matlab examples are provided for a fast prototyping for laboratory 
	experiments.

	Use of the library assumes the agreement with the term and conditions 
	specified below (II) and in the documentation file.

	For a complete access to code/functions, contact Dr Mari, at jean-martial.mari@inserm.fr.

	
	I CONTENT: TexoLibPublic.zip

		- The compiled library.

		- Matlab examples.

		- documentation.

	II TERMS AND CONDIIONS:
	
	  a) This software is provided as is, and is for research purpose only.

	  b) The authors, the INSERM (France) or the Imperial College London (United Kingdom) cannot be held 
	  responsible for any loss or damages occurring in relation with the use of this library, or related
	  programs and code.

	  c) This library is provided for free and it is strictly forbidden to sell it alone or as part
	  of a package.

	  d) This library is intended to be used by professionals of ultrasound imaging that are
	  aware of the risks linked with ultrasound imaging to both living being and
	  equipment.

	  e) This library is not intended for clinical use.

	  f) Components originally provided by UltrasonixTM (Texo components) remains the
	  property of UltrasonixTM and cannot be used without their explicit approval.

	III TO INSTALL THE LIBRARY:

	    * Extract the zip file to a folder in the scanner
	
	    * Open TexoProcesses\openPaths.m
	
	    * Change rootPath to the new home folder, eg:
		rootPath = 'D:\SonixProgramming\TexoLib';

	IV CREDIT:

	  o Original creation: Jean Martial Mari, PhD, 2007.(jm.mari@imperial.ac.uk)

	  o Public library creation: Richard Criddle / Jean Martial Mari 2009

	  o Update and portability: Jean Martial Mari 2010.

	  o This library was created with the support of Dr MengXing Tang and Emeritus
	  Prof. Colin G. Caro, Department of Bioengineering, Imperial College London, UK, and Dr Cyril Lafon 
	  INSERM U556, Lyon, France.

	V  Update of V2.5:

	  - release of the sequence building function.
	  - debugging of an error from VS 2005 preventing protability on many machines.
	  - many new functions to read the parameters of the Texo engine (frame size, frame rate, etc); function can be found
	   in the MatlabTexoFunctions directory.
	  

