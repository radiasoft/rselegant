&initial_coordinates y_cm=0.0 yp=0.0 x_cm=0.0 xp=0, z_cm=0.0 &end

&cylinder label="Hole",
          material="VACUUM",
          r_lower_cm=0.0,
          r_upper_cm=0.03,
          z_lower_cm=0.0,
          z_upper_cm=0.1,
&end

&cylinder label="Tungsten cylinder",
          material="WLC",
          r_lower_cm=0.0,
          r_upper_cm=1.0,
          z_lower_cm=0.0,
          z_upper_cm=0.10
&end

&cylinder label="Monitoring block",
         outputfile = <output>,
         material = "VACUUM",
         z_lower_cm=0.10,
         z_upper_cm=0.11,
         r_lower_cm=0.0,
         r_upper_cm=1.0,
&end

&cylinder label="Vacuum around entire system",
          material = "VACUUM",
       z_lower_cm=0.0,
       z_upper_cm=0.11,
       r_lower_cm=0.0,
       r_upper_cm=1.0,
&end
       
