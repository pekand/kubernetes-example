<?php

echo base64_encode(file_get_contents("project.dev.crt"));
echo "\n\n\n";
echo base64_encode(file_get_contents("project.dev.key"));