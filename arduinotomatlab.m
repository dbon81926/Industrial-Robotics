% Create a serial port object
s = serialport("COM4", 9600);  % Replace 'COM4' with the correct COM port

try
    while true
        data = readline(s);  % Read a line of data from the Arduino
        disp(data);  % Display the received data
        
        if strcmp(data, 'ESTOP ON')
            % Take action when the LED is turned on
            % Add your code here
        elseif strcmp(data, 'ESTOP OFF')
            % Take action when the LED is turned off
            % Add your code here
        end
    end
catch
    close(s);
end
