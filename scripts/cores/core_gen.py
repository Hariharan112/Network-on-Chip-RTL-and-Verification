import random

# Function to generate a packet using the provided 16-bit src-dst combination
def generate_packet(src_dst_combination):
    # Random 13-bit value
    random_13_bits = random.randint(0, (1 << 13) - 1)

    # Extract 8-bit source and destination addresses from the combination
    src_addr = src_dst_combination[:8]   # First 8 bits are the source address
    dst_addr = src_dst_combination[8:]   # Last 8 bits are the destination address

    # Create the header by appending src and dst to the random 13-bit value
    header = "001{0:013b}{1}{2}".format(random_13_bits, src_addr, dst_addr)

    # Fixed data payload (remains constant)
    data = [
        "00000000000000000000000000000000",
        "00000000000000000000000000000000"
        # "01000000000000000000000000000000",
        # "01111111111111111111111111111111"
    ]

    # Combine header and data into a packet
    packet = [header] + data
    return packet

# Function to save packets to a file
def save_packets_to_file(packets, filename):
    with open(filename, 'w') as f:
        for packet in packets:
            for line in packet:
                f.write(line + '\n')
            # f.write('\n')  # Blank line between packets

# Read source-destination combinations from a text file
def read_address_combinations(file_path):
    combinations = []
    with open(file_path, 'r') as f:
        for line in f:
            # Each line should contain the 16-bit source-destination combination
            src_dst_combination = line.strip()  # Remove surrounding whitespace/newlines
            combinations.append(src_dst_combination)
    return combinations

# Generate packets based on the src-dst combinations for a specific core
def generate_packets_for_core(combinations, core_num):
    packets = []
    core_bin = "{0:08b}".format(core_num)  # 8-bit binary representation of the core number
    
    for src_dst_combination in combinations:
        src_addr = src_dst_combination[:8]  # Extract the 8-bit source address
        if src_addr == core_bin:  # Ensure the source address matches the core number
            packet = generate_packet(src_dst_combination)
            packets.append(packet)

    return packets

# Main part of the script
def main():
    rows = 3
    columns = 3
    input_file = "traffic{0}x{1}.txt".format(rows, columns)  # Path to the input file containing the src-dst combinations
    core_no = 0
    # Read the address combinations from the file
    address_combinations = read_address_combinations(input_file)

    # Generate and save packets for each core
    for row in range(rows):
        for col in range(columns):
            core_addr = (row << 4) | col
            packets = generate_packets_for_core(address_combinations, core_addr)
            save_packets_to_file(packets, 'core{0}.txt'.format(core_no))
            core_no += 1

    print("Packets generated and saved.")

if __name__ == "__main__":
    main()
