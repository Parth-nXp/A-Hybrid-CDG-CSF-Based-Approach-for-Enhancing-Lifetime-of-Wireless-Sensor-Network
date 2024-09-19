# A Hybrid CDG-CSF Based Approach for Enhancing Lifetime of Wireless Sensor Network
## Project Description: CDG-CSF Sensor Data Processing

This GitHub project focuses on implementing the CDG (Compressive Data Gathering) and CSF (Compressive Sensing Framework) techniques for practical sensor data processing. The project provides flexibility in choosing between CDG, CSF, or a combination of both for handling sensor data. Additionally, it allows users to specify the type of data (normal, abnormal, practical, or sinusoidal) and the sensing matrix (normal or modified) based on their specific requirements.

## Usage Instructions:

### CDG Technique for Practical Sensor Data:
1. Run main.m.
2. When prompted, select the type of data:
  Enter 1 for image or 2 for sensor data.
3. Enter the number of sensors required (between 5 and 1000).
4. Select the technique:
  Enter 1 for CDG, 2 for CSF, or 3 for CDG and CSF combined.
5. Choose the type of data:
  Enter 1 for normal, 2 for abnormal, 3 for practical, or 4 for sinusoidal.
6. Specify the sensing matrix:
  Enter 1 for normal sensing matrix or 2 for modified sensing matrix.

### CDG Technique for Abnormal Sensor Data without Modified Sensing Matrix:
1. Follow the same steps as above, with the only difference being the selection of abnormal data type (2) and normal sensing matrix (1).

### CDG Technique for Abnormal Sensor Data with Modified Sensing Matrix:
1. Follow the same steps as above, with the only difference being the selection of abnormal data type (2) and modified sensing matrix (2).

### CSF Technique for Practical Sensor Data:
1. Run main.m.
2. When prompted, select the type of data:
  Enter 1 for image or 2 for sensor data.
3. Enter the number of sensors required (between 5 and 1000).
4. Select the technique:
  Enter 1 for CDG, 2 for CSF, or 3 for CDG and CSF combined.
5. Enter the number of active sensors (if applicable).
6. Choose the type of data:
  Enter 1 for normal, 2 for abnormal, 3 for practical, or 4 for sinusoidal.
7. Specify the sensing matrix:
  Enter 1 for normal sensing matrix or 2 for modified sensing matrix.

### CDG and CSF Combined Technique for Practical Sensor Data:
1. Follow the same steps as above, with the only difference being the selection of CDG and CSF combined technique (3).


#### Feel free to explore and modify the code to suit your specific needs. Contributions and feedback are welcome!



This is implementation of - GV Kumar, P Sharma and PM Pradhan (2023). A Hybrid CDG-CSF Based Approach for Enhancing Lifetime of Wireless Sensor Network. IEEE 7th International Conference on Computer Applications in Electrical Engineering-Recent Advances (CERA), Roorkee, India.
